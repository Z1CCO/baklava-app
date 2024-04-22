import 'package:coffee_app/ui/home/widgets/standart_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackItem extends StatelessWidget {
  List<String> list;
  String name;
  BackItem({super.key, required this.name, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.amber,
        image: DecorationImage(
          colorFilter: const ColorFilter.mode(
              Color.fromARGB(91, 158, 158, 158), BlendMode.srcOver),
          fit: BoxFit.cover,
          image: AssetImage(name),
        ),
      ),
      height: 240.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            list.length,
            (index) => StandartItem(
              id: list[index],
            ),
          ),
        ),
      ),
    );
  }
}
