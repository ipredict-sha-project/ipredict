import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<UserCredential> createAccount(
    String email,
    String password,
    String name,
  );

  Future<UserCredential> login(
    String email,
    String password,
  );

  Future<User?> signInWithGoogle();
  Future<void> resetPassword(String email);
}
