import 'package:coffee_app/main.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:coffee_app/ui/login/my_button.dart';
import 'package:coffee_app/ui/login/mytextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  const SignUpScreen({super.key, required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool creator = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController coniformpasswordController = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  void signUp() async {
    if (passwordController.text != coniformpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('email or password is incorrect'),
        ),
      );
      return;
    } else {
      try {
        validateForm(usernamecontroller.text);
        if (creator) {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
          addUserFirebase(
            usernamecontroller.text.trim(),
            passwordController.text.trim(),
            emailController.text.trim(),
            userCredential.user!.uid,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'creator false',
              ),
            ),
          );
        }
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
  }

  Future addUserFirebase(
      String usernamme, String password, String email, String userid) async {
    await userDB.collection('users').doc(userid).set({
      'username': usernamme,
      'password': password,
      'email': email,
      'userid': userid,
      'admin': false,
    });
  }

  validateForm(
    String? text,
  ) {
    if (text == null) {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'create username',
          ),
        ),
      );
    } else {
      if (text.trim().length < 3 || text.isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'username is short',
            ),
          ),
        );
      } else if (text.trim().length > 15) {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'username is long',
            ),
          ),
        );
      } else {
        setState(() {});
        creator = true;
      }
    }

    return null;
  }

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
              height: 90,
              child: Center(
                child: Image(
                  color: Colors.red,
                  image: AssetImage('assets/images/bak.png'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                'SignUp',
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
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, bottom: 4.0),
                    child: MyText(
                      text: 'Username',
                      color: Colors.red,
                      size: 22.0,
                    ),
                  ),
                  MyTextField(
                    controller: usernamecontroller,
                    icon: Icons.person,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, bottom: 4.0),
                    child: MyText(
                      text: 'Email',
                      color: Colors.red,
                      size: 22.0,
                    ),
                  ),
                  MyTextField(
                    controller: emailController,
                    icon: Icons.email_outlined,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, bottom: 4.0),
                    child: MyText(
                      text: 'Password',
                      color: Colors.red,
                      size: 22.0,
                    ),
                  ),
                  MyTextField(
                    controller: coniformpasswordController,
                    icon: Icons.vpn_key,
                    truefalse: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, bottom: 4.0),
                    child: MyText(
                      text: 'Coniform password',
                      color: Colors.red,
                      size: 22.0,
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
                    text: 'Sign Up',
                    onTap: signUp,
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
                    'Already have an account? ',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.brown.shade400,
                        fontFamily: 'ConcertOne'),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login',
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
