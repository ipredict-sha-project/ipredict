import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repo/repo.dart';
import '../data_source/data_source.dart';

class AuthRepoImp implements AuthRepo {
  final AuthDataSource dataSource;

  AuthRepoImp(this.dataSource);

  @override
  Future<UserCredential> createAccount(
    String email,
    String password,
    String name,
  ) {
    return dataSource.createAccount(email, password, name);
  }

  @override
  Future<UserCredential> login(
    String email,
    String password,
  ) {
    return dataSource.login(email, password);
  }

  @override
  Future<User?> signInWithGoogle() {
    return dataSource.signInWithGoogle();
  }

  @override
  Future<void> resetPassword(String email) {
    return dataSource.resetPassword(email);
  }
}
