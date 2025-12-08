import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static Future<UserCredential> createAccount(
      String email, String password, String name) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.updateDisplayName(name);
      await credential.user!.sendEmailVerification();
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserCredential> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } catch (e) {
      throw 'Invalid Email Or Password';
    }
  }

  static Future<User?> signInWithGoogle() async {
    GoogleSignIn.instance.initialize(
      serverClientId:
      "538153412800-iaeefm3u5v44satndea3838kq4gk445p.apps.googleusercontent.com",
    );
    // Trigger the authentication flow
    try{
      final GoogleSignInAccount? googleUser =
      await GoogleSignIn.instance.authenticate();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth = googleUser.authentication;

        // Create a new credential
        final credential =
        GoogleAuthProvider.credential(idToken: googleAuth.idToken);

        // Once signed in, return the UserCredential
        var card = await FirebaseAuth.instance.signInWithCredential(credential);
        return card.user;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }
}
