import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/ui/home/tabs/back.dart';
import 'package:flutter/material.dart';

class Baklava extends StatefulWidget {
  const Baklava({
    super.key,
  });

  @override
  State<Baklava> createState() => _BaklavaState();
}

class _BaklavaState extends State<Baklava> {
  late final Future? _future;

  @override
  void initState() {
    _future = getActivityuser();
    super.initState();
  }

  Future getActivityuser() async {
    await FirebaseFirestore.instance
        .collection('food')
        .orderBy(
          'postId',
        )
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
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: BackItem(
            name: 'assets/images/baklavaback.jpg',
            list: posts,
          ),
        );
      },
    );
  }
}
