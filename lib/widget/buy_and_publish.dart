import 'package:coffee_app/ui/screens/home/view/my_container.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuyAndPublish extends StatelessWidget {
  String text;
  BuyAndPublish({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MyContainerBorder(
        color: Colors.amber,
        width: double.infinity,
        height: 55.0,
        title: Center(
          child: MyText(
            height: -0.6,
            size: 22.0,
            text: text,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
