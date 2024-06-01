import 'package:coffee_app/ui/screens/home/view/my_container.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  const Profile({
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: '',
                size: 24.0,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      MyText(
                        text: '',
                        size: 24.0,
                        color: Colors.black,
                      ),
                      MyText(
                        text: 'parol ',
                        size: 24.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  icons.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: MyContainerBorder(
                        color: Colors.amber,
                        height: 50,
                        title: icons[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
