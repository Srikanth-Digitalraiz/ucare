// import 'package:Myclinic/Screen/home.dart';
// import 'package:Myclinic/Screen/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ucare/Screen/home.dart';
import 'package:ucare/Screen/login.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginPage();
          }
        });
  }

  //Sign out
  static Future<bool> signOut() async {
    bool isSignOut = false;

    await FirebaseAuth.instance.signOut().then((v) {
      isSignOut = true;
    }).catchError((e) {
      print(e); //Invalid otp
      isSignOut = false;
    });

    return isSignOut;
  }

  //SignIn
  Future<bool> signIn(AuthCredential authCreds) async {
    bool isVerified = false;
    CircularProgressIndicator();
    await FirebaseAuth.instance.signInWithCredential(authCreds).then((auth) {
      print("Auth"); //Successfully otp verified
      isVerified = true;
    }).catchError((e) {
      print(e); //Invalid otp
      isVerified = false;
    });
    return isVerified;
  }

  Future<bool> signInWithOTP(smsCode, verId) async {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    bool verified = await signIn(authCreds);

    return verified;
  }
}
