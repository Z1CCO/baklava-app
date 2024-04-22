import 'package:coffee_app/ui/home/tabs/back.dart';
import 'package:flutter/material.dart';

class Tea extends StatelessWidget {
  const Tea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: BackItem(
        name: 'assets/images/tea.jpg',
        list: const [],
      ),
    );
  }
}
