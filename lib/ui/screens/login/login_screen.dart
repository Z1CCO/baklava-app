import 'dart:developer';

import 'package:coffee_app/ui/screens/login/login_header.dart';
import 'package:coffee_app/ui/screens/login/my_button.dart';
import 'package:coffee_app/ui/screens/login/mytextfield.dart';
import 'package:coffee_app/ui/screens/login/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: emailController.text,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Telefon raqam noto\'g\'ri'),
            ),
          );
          log(error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SignUpScreen(
                phone: emailController.text,
                id: verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {
          log('Xato');
        });
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
              padding: EdgeInsets.only(left: 24.0, top: 12),
              child: Text(
                'Ro\'yhatdan O\'tish',
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 30.0,
                    fontFamily: 'ConcertOne'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.yellow.shade100,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.brown,
                        offset: Offset(3, 3),
                        blurRadius: 12),
                    BoxShadow(
                      color: Colors.brown,
                      blurRadius: 12,
                      offset: Offset(-3, -3),
                    ),
                  ]),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    controller: emailController,
                    icon: Icons.call,
                    truefalse: false,
                    text: 'Telefon raqamni to\'liq kiriting',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyButton(
                    text: 'Yuborish',
                    onTap: login,
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 24.0, left: 12.0, right: 12.0),
              child: Text(
                'Ro\'yhatdan o\'tganingizdan keyin ilovadan       to\'liq foydalanishingiz mumkin.',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.brown.shade400,
                    fontFamily: 'ConcertOne'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
