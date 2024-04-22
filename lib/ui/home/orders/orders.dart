import 'package:coffee_app/ui/my_text.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.amber.shade200,
        appBar: AppBar(
          title: const Text(
            'Orders',
            style: TextStyle(
                height: -0.6,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'ConcertOne'),
          ),
          leading: const BackButton(),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber.shade200,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40.0,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.shade200),
                child: TabBar(
                  labelPadding: const EdgeInsets.only(bottom: 7),
                  labelStyle: const TextStyle(
                      height: 0.0,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ConcertOne'),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.shade500),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: 'Active'),
                    Tab(text: 'Done'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.red,
                image: DecorationImage(
                  scale: 1.5,
                  image: AssetImage('assets/images/bak.png'),
                ),
              ),
              child: const SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              width: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.red,
                image: DecorationImage(
                  scale: 1.5,
                  image: AssetImage('assets/images/bak.png'),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      margin: const EdgeInsets.fromLTRB(12.0, 12, 12, 0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            SizedBox(
                              height: 70,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    height: 0.0,
                                    text: 'Baklava',
                                    size: 25.0,
                                  ),
                                  MyText(
                                    height: 2.0,
                                    text: '\$55.0',
                                    size: 22.0,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
