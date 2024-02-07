import 'package:flutter/material.dart';
import 'package:health_reminders/pages/lanrelog/home.dart';
import 'package:health_reminders/pages/lanrelog/landing.dart';
import 'package:health_reminders/styles/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: landingPage(),
      routes: {
        '/home': (context) => homePage(),
      },
    );
  }
}
