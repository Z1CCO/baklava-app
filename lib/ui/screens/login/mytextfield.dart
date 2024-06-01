import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  IconData icon;
  bool? truefalse;
  TextEditingController controller;
  String text;
  MyTextField({
    required this.controller,
    required this.icon,
    required this.text,
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
              hintStyle: const TextStyle(color: Colors.brown, fontSize: 17.0),
              hintText: text,
              contentPadding: const EdgeInsets.all(8),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.red,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
              filled: true,
              fillColor: Colors.amberAccent.shade200),
        ),
      ),
    );
  }
}
