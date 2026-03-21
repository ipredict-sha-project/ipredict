import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'data_source.dart';

class AuthDataSourceImp implements AuthDataSource {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<UserCredential> createAccount(
      String email,
      String password,
      String name,
      ) async {
    final credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user!.updateDisplayName(name);

    await credential.user!.sendEmailVerification();

    await firestore.collection('users').doc(credential.user!.uid).set({
      "name": name,
      "email": email,
      "provider": "email",
      "createdAt": Timestamp.now(),
    }, SetOptions(merge: true));

    return credential;
  }

  @override
  Future<UserCredential> login(
      String email,
      String password,
      ) async {
    final credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential;
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser =
      await googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
      await auth.signInWithCredential(credential);

      final user = userCredential.user;

      final doc =
      await firestore.collection('users').doc(user!.uid).get();

      if (!doc.exists) {
        await firestore.collection('users').doc(user.uid).set({
          "name": user.displayName ?? "",
          "email": user.email ?? "",
          "provider": "google",
          "createdAt": Timestamp.now(),
        }, SetOptions(merge: true));
      }

      return user;
    } catch (e) {
      throw Exception("Google Sign-In failed");
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}