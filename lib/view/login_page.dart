import 'package:flutter/material.dart';
import 'package:login_task/controller/login_controller.dart';
import 'package:login_task/view/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/sign_button.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: logInUI(),
    );
  }

  logInUI() {
    return Consumer<LoginController>(
      builder: (context, model, child) {
        if (model.userInfo != null) {
          return ProflePage(model);
        } else {
          return loginControle(context);
        }
      },
    );
  }

  loginControle(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign In",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Image.asset(
              'assets/image/logo.png',
              width: 200.0,
            ),
            const SizedBox(
              height: 50.0,
            ),
            SignInButton(
              buttonType: ButtonType.google,
              onPressed: () {
                Provider.of<LoginController>(context, listen: false)
                    .googleLogin();
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            SignInButton(
              buttonType: ButtonType.facebook,
              onPressed: () {
                Provider.of<LoginController>(context, listen: false)
                    .facebookLogin();
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            SignInButton(
              buttonType: ButtonType.apple,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
