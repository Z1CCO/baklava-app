import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/ui/screens/home/popular.dart';
import 'package:coffee_app/user.dart';
import 'package:coffee_app/widget/app_version.dart';
import 'package:coffee_app/ui/screens/home/home_header.dart';
import 'package:coffee_app/ui/screens/home/tabs/baklava.dart';
import 'package:coffee_app/ui/screens/home/tabs/coffee.dart';
import 'package:coffee_app/ui/screens/home/tabs/profile.dart';
import 'package:coffee_app/ui/screens/home/tabs/tea.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:coffee_app/ui/screens/home/orders/oreders_button.dart';
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
      future: FirebaseFirestore.instance.collection('food').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                      children: const [
                        Baklava(),
                        Coffee(),
                        Tea(),
                        Profile(),
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
                  const HomePopular(),
                  OredersTapp(
                    admin: true,
                  ),
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
