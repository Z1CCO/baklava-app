import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 180.0,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(102, 102),
            ),
          ),
        ),
        const Image(
          image: AssetImage(
            'assets/images/baklava.png',
          ),
        ),
        const Positioned(
          right: 0.0,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              width: 90,
              child: Image(
                color: Colors.white,
                image: AssetImage(
                  'assets/images/bak.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
