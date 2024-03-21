import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sos_mobile/cores/auth/create_account/screens/create_account_screen.dart';
import 'package:sos_mobile/modules/home/screen/home_screen.dart';

class AuthGmailService {
  static AuthGmailService? _obj;
  AuthGmailService._();
  static AuthGmailService get obj => _obj ??= AuthGmailService._();
  handleAuthState() {
    debugPrint("handle auth state ");
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const CreateAccountScreen();
          }
        });
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: ['email'],
      ).signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential

        UserCredential nnn =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return nnn.user;
      } else {
        return Future.error("cancel");
      }
    } catch (e) {
      Future.error("something were worng");
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }
}
