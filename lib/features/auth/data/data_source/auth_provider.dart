import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/app_dialogs/app_dialogs.dart';
import '../../../../core/routes_manager/routes/app_route_name.dart';
import '../../data/data_source/data_source_imp.dart';
import '../../data/repo/repo_imp.dart';
import '../../presentation/screens/otp_screen.dart';

class AuthProvider extends ChangeNotifier {
  /// CURRENT USER
  User? currentUser;

  String get userName => currentUser?.displayName ?? "";
  String get userEmail => currentUser?.email ?? "";

  /// Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String fullPhoneNumber = "";
  String verificationId = "";

  TextEditingController otpController = TextEditingController();

  int resendSeconds = 60;
  bool canResend = false;
  Timer? _timer;

  /// Password visibility
  ValueNotifier<bool> password = ValueNotifier(true);

  bool isLoading = false;
  bool isShowPassword = true;

  /// Repository
  final AuthRepoImp repo = AuthRepoImp(AuthDataSourceImp());

  AuthProvider() {
    currentUser = FirebaseAuth.instance.currentUser;
  }

  /// Loading Helpers
  void startLoading() {
    isLoading = true;
    isShowPassword = false;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    isShowPassword = true;
    notifyListeners();
  }

  /// Navigation Helper
  void navigateAndClear(BuildContext context, String route) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
          (route) => false,
    );
  }
  /// CREATE ACCOUNT
  Future<void> createAccount(BuildContext context) async {
    startLoading();

    try {
      await repo.createAccount(
        emailController.text,
        passwordController.text,
        nameController.text,
      );

      AppDialogs.showMessage(
        context,
        title: "Please check your email inbox",
      );
    } catch (e) {
      AppDialogs.showMessage(
        context,
        title: e.toString(),
        type: MessageType.error,
      );
    }

    stopLoading();
  }
  /// LOGIN
  Future<void> login(BuildContext context) async {
    startLoading();

    try {
      var user = await repo.login(
        emailController.text,
        passwordController.text,
      );

      if (user.user != null && user.user!.emailVerified) {
        currentUser = user.user;

        notifyListeners();

        navigateAndClear(context, AppRouteName.layout);

        AppDialogs.showMessage(
          context,
          title: "Welcome , ${user.user?.displayName ?? ''}",
        );
      } else {
        AppDialogs.showMessage(
          context,
          title: "Email Not Verified , Check Your Email",
          type: MessageType.error,
        );
      }
    } catch (e) {
      AppDialogs.showMessage(
        context,
        title: e.toString(),
        type: MessageType.error,
      );
    }

    stopLoading();
  }
  /// GOOGLE LOGIN
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      var user = await repo.signInWithGoogle();

      if (user != null) {
        currentUser = user;

        notifyListeners();

        navigateAndClear(context, AppRouteName.layout);

        AppDialogs.showMessage(
          context,
          title: "Welcome , ${user.displayName ?? ''}",
        );
      } else {
        AppDialogs.showMessage(
          context,
          title: "Google Sign In Cancelled",
          type: MessageType.error,
        );
      }
    } catch (e) {
      AppDialogs.showMessage(
        context,
        title: "Google Sign-In failed",
        type: MessageType.error,
      );
    }
  }
  /// RESET PASSWORD
  Future<void> resetPassword(BuildContext context) async {
    try {
      startLoading();

      await repo.resetPassword(emailController.text.trim());

      AppDialogs.showMessage(
        context,
        title: "Password reset email sent",
      );

      Navigator.pop(context);
    } catch (e) {
      AppDialogs.showMessage(
        context,
        title: e.toString(),
        type: MessageType.error,
      );
    }

    stopLoading();
  }
  /// LOGOUT
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();

    currentUser = null;

    notifyListeners();
  }
  /// OTP SEND
  Future<void> sendOtp(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,

        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);

          currentUser = FirebaseAuth.instance.currentUser;

          Navigator.pushReplacementNamed(context, AppRouteName.layout);
        },

        verificationFailed: (e) {
          isLoading = false;
          notifyListeners();
        },

        codeSent: (verId, _) {
          verificationId = verId;

          startResendTimer();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OtpScreen()),
          );

          isLoading = false;
          notifyListeners();
        },

        codeAutoRetrievalTimeout: (verId) {
          verificationId = verId;
        },
      );
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
  /// VERIFY OTP
  Future<void> verifyOtp(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text.trim(),
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      currentUser = FirebaseAuth.instance.currentUser;

      Navigator.pushReplacementNamed(context, AppRouteName.layout);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP")),
      );
    }

    isLoading = false;
    notifyListeners();
  }
  /// RESEND OTP
  Future<void> resendOtp(BuildContext context) async {
    if (!canResend) return;

    await sendOtp(context);
  }

  void startResendTimer() {
    resendSeconds = 60;
    canResend = false;
    notifyListeners();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds == 0) {
        canResend = true;
        timer.cancel();
      } else {
        resendSeconds--;
      }
      notifyListeners();
    });
  }

  /// DISPOSE
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
    otpController.dispose();
    password.dispose();

    _timer?.cancel();

    super.dispose();
  }
}