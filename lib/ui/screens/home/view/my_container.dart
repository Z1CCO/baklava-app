import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyContainerBorder extends StatelessWidget {
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  bool? shadow;
  Widget title;
  Border? border;
  Color? color;
  BorderRadius? radius;
  MyContainerBorder({
    required this.title,
    this.padding,
    this.border,
    this.radius,
    this.width,
    this.shadow,
    this.height,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: border ?? Border.all(color: Colors.black, width: 2),
        color: color ?? Colors.amber.shade100,
        borderRadius: radius ?? BorderRadius.circular(8),
        boxShadow: [
          shadow == true
              ? const BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                  spreadRadius: 0.5,
                  offset: Offset(2, 2),
                )
              : const BoxShadow(),
          shadow == true
              ? const BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                  spreadRadius: 0.5,
                  offset: Offset(-2, -2),
                )
              : const BoxShadow(),
        ],
      ),
      child: title,
    );
  }
}
