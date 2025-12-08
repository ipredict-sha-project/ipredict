import 'package:flutter/material.dart';

import '../../../../core/app_dialogs/app_dialogs.dart';
import '../../../../core/routes_manager/routes/app_route_name.dart';
import '../services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> password = ValueNotifier<bool>(true);
  bool isLoading = false;
  bool isShowPassword = true;

  Future<void> createAccount(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    isShowPassword = false;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      try {
        var user = await AuthServices.createAccount(
            emailController.text, passwordController.text, nameController.text);
        AppDialogs.showMessage(context, title: 'please Check Your Email Inbox');
      } catch (e) {
        AppDialogs.showMessage(context,
            title: e.toString(), type: MessageType.error);
      }
    }
    isLoading = false;
    notifyListeners();
    isShowPassword = true;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    isShowPassword = false;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      try {
        var user = await AuthServices.login(
            emailController.text, passwordController.text);
        if (user.user!.emailVerified) {
          Navigator.pushReplacementNamed(context, AppRouteName.layout);
          AppDialogs.showMessage(context,
              title: 'Welcome , ${user.user?.displayName ?? ''}');
        } else {
          AppDialogs.showMessage(context,
              title: 'Email Not Verified , Check Your Email',
              type: MessageType.error);
        }
      } catch (e) {
        AppDialogs.showMessage(context,
            title: e.toString(), type: MessageType.error);
      }
    }
    isLoading = false;
    notifyListeners();
    isShowPassword = true;
    notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    var user = await AuthServices.signInWithGoogle();
    Navigator.pushReplacementNamed(context, AppRouteName.layout);
    AppDialogs.showMessage(context,
        title: 'Welcome , ${user?.displayName ?? ''}');
  }
}
