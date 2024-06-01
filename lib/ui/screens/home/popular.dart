import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/ui/screens/home/widgets/carousel_item.dart';
import 'package:flutter/material.dart';

class HomePopular extends StatefulWidget {
  const HomePopular({
    super.key,
  });

  @override
  State<HomePopular> createState() => _HomePopularState();
}

class _HomePopularState extends State<HomePopular> {
  late final Future? _future;

  @override
  void initState() {
    _future = getActivityuser();
    super.initState();
  }

  Future getActivityuser() async {
    await FirebaseFirestore.instance
        .collection('food')
        .orderBy('costnumber', descending: true)
        .limit(3)
        .get()
        .then(
          // ignore: avoid_function_literals_in_foreach_calls
          (value) => value.docs.forEach(
            (element) {
              posts.add(element.reference.id);
            },
          ),
        );
  }

  List<String> posts = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CarouselSlider(
            items: List.generate(
              3,
              (index) => CaruselItem(
                data: posts[index],
              ),
            ),
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
            ),
          );
        });
  }
}
