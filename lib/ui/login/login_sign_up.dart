import 'package:coffee_app/ui/login/login_screen.dart';
import 'package:coffee_app/ui/login/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginAndSignUp extends StatefulWidget {
  const LoginAndSignUp({super.key});

  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}

class _LoginAndSignUpState extends State<LoginAndSignUp> {
  bool register = false;

  void onTap() {
    register = !register;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (register == false) {
      return LoginScreen(onTap: onTap);
    }
    return SignUpScreen(onTap: onTap);
  }
}
