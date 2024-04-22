import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/ui/home/upload/upload_screen.dart';
import 'package:coffee_app/ui/home/view/item_view.dart';
import 'package:coffee_app/user.dart';
import 'package:coffee_app/widget/app_version.dart';
import 'package:coffee_app/ui/home/widgets/carousel_item.dart';
import 'package:coffee_app/ui/home/home_header.dart';
import 'package:coffee_app/ui/home/tabs/baklava.dart';
import 'package:coffee_app/ui/home/tabs/coffee.dart';
import 'package:coffee_app/ui/home/tabs/profile.dart';
import 'package:coffee_app/ui/home/tabs/tea.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:coffee_app/ui/home/orders/oreders_button.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int selectedValue = 0;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future getActivityuser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser()!.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('food').doc(postId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            backgroundColor: Colors.red,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(
                    controller: _tabController,
                  ),
                  SizedBox(
                    height: 250.0,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        const Baklava(),
                        const Coffee(),
                        const Tea(),
                        Profile(
                          username: data['username'],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: MyText(
                      text: 'Popular',
                      size: 28.0,
                    ),
                  ),
                  CarouselSlider(
                    items: List.generate(
                      3,
                      (index) => GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ItemView(data: data),
                          ),
                        ),
                        child: CaruselItem(),
                      ),
                    ),
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                    ),
                  ),
                  OredersTapp(
                    admin: true,
                  ),
                  const AppVersion(),
                  const SizedBox(height: 25.0),
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
