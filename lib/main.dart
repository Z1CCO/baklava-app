import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/firebase_options.dart';
import 'package:coffee_app/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final userDB = FirebaseFirestore.instance;
final foodDB = FirebaseFirestore.instance.collection('food');
final storageRef = FirebaseStorage.instance.ref();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpalshScreen(),
    );
  }
}
