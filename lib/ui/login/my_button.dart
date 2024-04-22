import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  String text;
  final Function()? onTap;

  MyButton({
    required this.text,
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 50.0,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              alignment: Alignment.center, backgroundColor: Colors.red),
          onPressed: onTap,
          child: SizedBox(
            height: 60.0,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.amber,
                  fontFamily: 'ConcertOne'),
            ),
          ),
        ),
      ),
    );
  }
}
