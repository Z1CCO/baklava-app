import 'package:coffee_app/ui/home/view/my_container.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  String username;
  Profile({
    required this.username,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List icons = const [
      Icon(Icons.location_pin, size: 30.0),
      Icon(Icons.call, size: 30.0),
      Icon(Icons.share, size: 30.0),
    ];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 240.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Color.fromARGB(91, 158, 158, 158), BlendMode.srcOver),
            fit: BoxFit.cover,
            image: AssetImage('assets/images/profile.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber.shade200,
                  radius: 25.0,
                  child: const Icon(Icons.person_outline, size: 28.0),
                ),
                title: MyText(
                  text: username,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: List.generate(
                  icons.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyContainerBorder(
                        height: 50,
                        title: icons[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
