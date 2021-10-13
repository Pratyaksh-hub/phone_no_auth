import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:le_auth_proj/screens/starting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2E3B62),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Starting(),
    );
  }
}
