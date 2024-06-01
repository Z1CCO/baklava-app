import 'package:coffee_app/main.dart';
import 'package:coffee_app/ui/screens/home/view/item_view.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CaruselItem extends StatelessWidget {
  String data;
  double? width;
  double? height;
  CaruselItem({
    required this.data,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: foodDB.doc(data).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ItemView(
                  data: data,
                ),
              ),
            ),
            child: Container(
              width: width,
              height: height,
              margin:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            data['mediaUrl'],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: data['name'],
                              size: 24.0,
                            ),
                            Expanded(
                              child: SizedBox(
                                child: SingleChildScrollView(
                                  child: MyText(
                                    text: data['description'],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MyText(
                                  text: data['cost'],
                                  size: 24.0,
                                ),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
