import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/ui/screens/home/view/my_container.dart';
import 'package:coffee_app/ui/screens/home/view/plus_minus.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:coffee_app/user.dart';
import 'package:coffee_app/widget/buy_and_publish.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemView extends StatefulWidget {
  Map<String, dynamic> data;
  ItemView({super.key, required this.data});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  int number = 1;
  TextEditingController locationController = TextEditingController();
  void buyNow(String name, String cost, String number, String location) {
    FirebaseFirestore.instance
        .collection('orders')
        .doc(currentUser()!.uid)
        .set({
      'name': name,
      'cost': cost,
      'number': number,
      'location': location,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 290.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/baklavabackground.jpg',
                  ),
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 12,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 28.0, horizontal: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyContainerBorder(
                          title: const BackButton(
                            color: Colors.black,
                          ),
                        ),
                        MyContainerBorder(
                            width: 150,
                            height: 150,
                            shadow: true,
                            border: Border.all(color: Colors.black, width: 4),
                            title: Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    widget.data['mediaUrl'],
                                  ),
                                ),
                              ),
                            )),
                        MyContainerBorder(
                          width: 52.0,
                          height: 52.0,
                          title: Center(
                            child: MyText(
                              height: -0.5,
                              text: widget.data['number'],
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyContainerBorder(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                    title: MyText(
                      color: Colors.black,
                      text: widget.data['name'],
                      size: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
              child: Row(
                children: [
                  Expanded(
                    child: MyContainerBorder(
                      height: 50,
                      title: Center(
                        child: MyText(
                          height: -0.5,
                          text: widget.data['cost'],
                          color: Colors.black,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: MyContainerBorder(
                      height: 50,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlusMinus(
                            onTap: () {
                              number == 1 ? number -= 1 : () {};
                              setState(() {});
                            },
                            icon: Icons.exposure_minus_1,
                          ),
                          MyText(
                            height: -0.5,
                            text: number.toString(),
                            color: Colors.black,
                            size: 28.0,
                          ),
                          PlusMinus(
                            onTap: () {
                              if (number == widget.data['number']) {
                              } else {
                                number += 1;
                              }

                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MyContainerBorder(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                title: MyText(
                  height: 1.3,
                  size: 22.0,
                  text: widget.data['description'],
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              height: 75,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  controller: locationController,
                  cursorColor: Colors.red,
                  showCursor: true,
                  decoration: InputDecoration(
                      hintText: 'Joylashuv Kiritish',
                      contentPadding: const EdgeInsets.all(8),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.fromLTRB(4.0, 4, 8, 4),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      filled: true,
                      fillColor: Colors.amber),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
          onTap: () {
            locationController.text.isEmpty
                ? ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Joylashuv Kiritilmagan')),
                  )
                : buyNow(
                    widget.data['name'],
                    widget.data['cost'],
                    '1',
                    locationController.text,
                  );
          },
          child: BuyAndPublish(text: 'Buy Now')),
    );
  }
}
