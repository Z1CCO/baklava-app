import 'package:coffee_app/ui/my_text.dart';
import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 90,
          child: Image.asset('assets/images/bak.png'),
        ),
        const SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'Istambul',
            ),
            MyText(
              text: 'Baklava',
            ),
          ],
        ),
      ],
    );
  }
}
