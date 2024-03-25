import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_reminders/controller/plugin.dart';
import 'package:health_reminders/firebase_options.dart';
import 'package:health_reminders/views/Intro/landing_screen.dart';

import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AwesomeNotifications().isNotificationAllowed().then((isAlloewd) {
    if (!isAlloewd) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
  await NotificationServices.InitializaNotification();

  tzdata.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Bangkok'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyLandingScreen(),
    );
  }
}
