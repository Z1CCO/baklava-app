import 'package:coffee_app/main.dart';
import 'package:coffee_app/ui/home/view/item_view.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StandartItem extends StatelessWidget {
  final String id;
  const StandartItem({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: foodDB.doc(id).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ItemView(data: data),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(8),
                width: 160.0,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              data['mediaUrl'] ??
                                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Ficonduck.com%2Ficons%2F9536%2Fno-image&psig=AOvVaw16hmA7xFE6lFo24WH0e8pE&ust=1713425682342000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJDirMDeyIUDFQAAAAAdAAAAABAE',
                            ),
                          ),
                        ),
                      ),
                      MyText(
                        text: data['name'],
                        size: 24.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyText(
                            text: data['cost'],
                            size: 22.0,
                          ),
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
