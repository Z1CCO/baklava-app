import 'package:coffee_app/ui/login/login_header.dart';
import 'package:coffee_app/ui/login/my_button.dart';
import 'package:coffee_app/ui/login/mytextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow.shade100,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginHeader(),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 35.0,
                    fontFamily: 'ConcertOne'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0, bottom: 4.0),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.red,
                          fontFamily: 'ConcertOne'),
                    ),
                  ),
                  MyTextField(
                    controller: emailController,
                    icon: Icons.email_outlined,
                    truefalse: false,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0, bottom: 4.0),
                    child: Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.red,
                          fontFamily: 'ConcertOne'),
                    ),
                  ),
                  MyTextField(
                    controller: passwordController,
                    icon: Icons.vpn_key,
                    truefalse: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyButton(
                    text: 'Login',
                    onTap: () => login(context),
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.brown.shade400,
                        fontFamily: 'ConcertOne'),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 23.0,
                          color: Colors.brown,
                          fontFamily: 'ConcertOne'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
