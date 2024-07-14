import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // create account
  static Future<String> createAccountWithEmail(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return 'Account Created!';
    } catch (e) {
      return 'Error Occured > ${e.toString()}';
    }
  }

  // login with email password method
  static Future<String> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'Login Successful!';
    } catch (e) {
      return 'Error Occured > ${e.toString()}';
    }
  }

  // logout the user
  static Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  // check whether the user is signed in
  static Future isLoggedIn() async {
    var user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
