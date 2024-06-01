import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeHeader extends StatelessWidget {
  TabController controller;
  HomeHeader({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List title = [
      'baklava',
      'coffee',
      'tea',
      'profile',
    ];
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 120.0,
          decoration: const BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(91, 158, 158, 158), BlendMode.srcOver),
              fit: BoxFit.cover,
              image: AssetImage('assets/images/baklavabackground.jpg'),
            ),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 24, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Istambul Baklava',
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.white,
                        fontFamily: 'ConcertOne',
                      ),
                    ),
                    Text(
                      'your daily baklava needs',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: 'ConcertOne',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 90,
                  child: Image(
                    image: AssetImage(
                      'assets/images/bak.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 101),
          height: 55,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(18),
          ),
          child: TabBar(
            labelStyle:
                const TextStyle(fontSize: 18.0, fontFamily: 'ConcertOne'),
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.white,
            controller: controller,
            indicatorColor: Colors.amber,
            indicatorPadding: const EdgeInsets.only(bottom: 5),
            dividerColor: Colors.red,
            tabs: List.generate(
              title.length,
              (index) => Tab(
                text: title[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
