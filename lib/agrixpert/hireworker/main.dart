import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/hireworker/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Farm Connect', home: const HomeScreen());
  }
}
