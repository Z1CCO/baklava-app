import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlusMinus extends StatelessWidget {
  VoidCallback? onTap;
  IconData? icon;
  PlusMinus({
    this.icon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(color: Colors.black, width: 2.0),
            ),
            backgroundColor: Colors.amber),
        onPressed: onTap ?? () {},
        child: Icon(
          icon ?? Icons.add,
          color: Colors.black,
          size: 28.0,
        ),
      ),
    );
  }
}
