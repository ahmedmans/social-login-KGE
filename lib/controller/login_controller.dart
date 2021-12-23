import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_task/model/user_info.dart';

class LoginController with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserInfo? userInfo;

  // function for google sign in

  googleLogin() async {
    googleSignInAccount = await _googleSignIn.signIn();

    userInfo = UserInfo(
      displayName: googleSignInAccount!.displayName,
      email: googleSignInAccount!.email,
      photoUrl: googleSignInAccount!.photoUrl,
    );

    notifyListeners();
  }

  // function for facebook login
  facebookLogin() async {
    final result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email"],
    );

    if (result.status == LoginStatus.success) {
      final request = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );

      userInfo = UserInfo(
        displayName: request["name"],
        email: request["email"],
        photoUrl: request["picture"]["data"]["url"] ?? "",
      );

      notifyListeners();
    }
  }

  // function for  log out

  googleLogOut() async {
    googleSignInAccount = await _googleSignIn.signOut();

    await FacebookAuth.i.logOut();

    userInfo = null;
    notifyListeners();
  }
}
