import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_reminders/pages/lanrelog/home.dart';
import 'package:health_reminders/pages/lanrelog/landing.dart';
import 'package:health_reminders/pages/test.dart';
import 'package:health_reminders/styles/color.dart';

import '../firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: landingPage(),
    );
  }
}
