import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? googleSignInAccount;

  //log in function
  login() async {
    googleSignInAccount = await _googleSignIn.signIn();

    notifyListeners();
  }

  // log out function
  logout() async {
    googleSignInAccount = await _googleSignIn.signOut();

    notifyListeners();
  }
}
