import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/cores/walk_though/singin/screens/singin_screen.dart';
import 'package:sos_mobile/modules/home/screen/home_screen.dart';

class AuthService {
  //Determine if the user is authenticated.
  handleAuthState() {
    debugPrint("handle auth state ");
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const SingInScreen();
          }
        });
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => {
              debugPrint("user : ${value.user}"),
              router.go('/home-screen'),
            });
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
