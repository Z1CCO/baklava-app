import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  String text;
  double? size;
  Color? color;
  Color? backgroundColor;
  double? height;
  VoidCallback? button;
  MyText({
    required this.text,
    this.size,
    this.color,
    this.height,
    this.button,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: button ?? () {},
      child: Text(
        text,
        style: TextStyle(
            height: height ?? 1.4,
            fontSize: size ?? 18.0,
            color: color ?? Colors.white,
            fontFamily: 'ConcertOne',
            backgroundColor: backgroundColor ?? Colors.transparent),
      ),
    );
  }
}
