import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SignageRaceeApp());
}

class SignageRaceeApp extends StatelessWidget {
  const SignageRaceeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signage ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}