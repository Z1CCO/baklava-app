import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  IconData icon;
  bool? truefalse;
  TextEditingController controller;
  MyTextField({
    required this.controller,
    required this.icon,
    this.truefalse,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: TextField(
          controller: controller,
          obscureText: truefalse ?? false,
          cursorColor: Colors.red,
          showCursor: true,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 8),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    icon,
                    color: Colors.amber,
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(28),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(28),
              ),
              filled: true,
              fillColor: Colors.amberAccent.shade200),
        ),
      ),
    );
  }
}
