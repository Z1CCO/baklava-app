import 'dart:developer';

import 'package:coffee_app/main.dart';
import 'package:coffee_app/ui/screens/home/home_screen.dart';
import 'package:coffee_app/ui/screens/login/my_button.dart';
import 'package:coffee_app/ui/screens/login/mytextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key, required this.id, required this.phone});
  String id;
  String phone;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool creator = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow.shade100,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 150,
              child: Center(
                child: Image(
                  color: Colors.red,
                  image: AssetImage('assets/images/bak.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                'Kod kiritish',
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 35.0,
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
                    text: 'SMS kodni kiriting',
                    controller: emailController,
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyButton(
                    text: 'Yuborish',
                    onTap: () async {
                      try {
                        final cred = PhoneAuthProvider.credential(
                          verificationId: widget.id,
                          smsCode: emailController.text,
                        );
                        await FirebaseAuth.instance.signInWithCredential(cred);
                        userDB.collection('users').doc(widget.id).set({
                          'phone': widget.phone,
                          'userid': widget.id,
                          'admin': false,
                        });

                        Navigator.pushAndRemoveUntil(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                            (Route<dynamic> route) => false);
                      } catch (_) {
                        log(_.toString());
                      }
                    },
                  ),
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
                    'Sms kod kelimasa qaytadan urining!',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.brown.shade400,
                        fontFamily: 'ConcertOne'),
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
