import 'package:coffee_app/ui/home/view/my_container.dart';
import 'package:coffee_app/ui/home/view/plus_minus.dart';
import 'package:coffee_app/ui/my_text.dart';
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
  TextEditingController locationController = TextEditingController();
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
                      'assets/images/backgroundbaklava.avif',
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
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 0, 10.0, 10.0),
                              shadow: true,
                              border: Border.all(color: Colors.black, width: 4),
                              title: Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
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
                              icon: Icons.exposure_minus_1,
                            ),
                            MyText(
                              height: -0.5,
                              text: widget.data['costnumber'].toString(),
                              color: Colors.black,
                              size: 28.0,
                            ),
                            PlusMinus(),
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
                  padding: const EdgeInsets.all(6),
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
                        hintText: 'Location',
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: const Icon(
            Icons.location_on,
            color: Colors.amber,
            size: 35.0,
          ),
        ),
        bottomNavigationBar: BuyAndPublish(text: 'Buy Now'));
  }
}
