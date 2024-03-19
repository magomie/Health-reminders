import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:health_reminders/controller/plugin.dart';

import 'package:health_reminders/model/mode.dart';

import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:health_reminders/views/AppMenu/notification/addNotiScreen.dart';
import 'package:page_transition/page_transition.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class showNotiScreen extends StatefulWidget {
  final String userId;
  final String titleNoti;
  final String labelNotiText;
  const showNotiScreen(
      {super.key,
      required this.userId,
      required this.titleNoti,
      required this.labelNotiText});

  @override
  State<showNotiScreen> createState() => _showNotiScreenState();
}

class _showNotiScreenState extends State<showNotiScreen> {
  void initState() {
    NotificationProvider.checkReminders((widget.userId));
  }

  /*FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializaNotifications();
    tz.initializeTimeZones();
    _fetchAndScheduleNotifications();
  }

  Future<void> initializaNotifications() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _fetchAndScheduleNotifications() async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot querySnapshot =
        await users.doc(widget.userId).collection('Notification').get();

    querySnapshot.docs.forEach((doc) async {
      // แปลงข้อมูลจาก Object? เป็น Map<String, dynamic>
      Map<String, dynamic>? notificationData =
          doc.data() as Map<String, dynamic>?;

      // ตรวจสอบว่า notificationData ไม่เป็น null
      if (notificationData != null) {
        // ตรวจสอบว่าถึงเวลาแจ้งเตือนหรือยัง
        if (_isNotificationTime(notificationData)) {
          // ตั้งเวลาแจ้งเตือน

          await _scheduleNotification(doc['notiId'], notificationData);
          print(doc['notiId']);

          // อัปเดตสถานะของแจ้งเตือนเป็น "เสร็จสิ้น"
          await users
              .doc(widget.userId)
              .collection('Notification')
              .doc(doc['notiId'])
              .update({'notiStatus': 'fish'});
        }
      }
    });
  }

  bool _isNotificationTime(Map<String, dynamic> notificationData) {
    // ตรวจสอบว่าเวลาแจ้งเตือนมากกว่าหรือเท่ากับเวลาปัจจุบันหรือไม่
    var selectedDateTime = DateTime.parse(notificationData['selectedDateTime']);
    return selectedDateTime.isBefore(DateTime.now());
  }

  Future<void> _scheduleNotification(
      String notiId, Map<String, dynamic> notificationData) async {
    var androidPlatformChannelSpecifics =
        AndroidNotificationDetails('id', 'name');
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // แปลงเวลาที่ระบุใน notificationData เป็น TimeZone ของอุปกรณ์
    DateTime selectedDateTime =
        DateTime.parse(notificationData['selectedDateTime']);
    var scheduledDate = tz.TZDateTime.from(selectedDateTime, tz.local);

    // ตรวจสอบว่า scheduledDate เป็นอนาคตหรือไม่
    if (scheduledDate.isAfter(DateTime.now())) {
      var timestamp = scheduledDate.millisecondsSinceEpoch;

      await flutterLocalNotificationsPlugin.zonedSchedule(
        timestamp,
        notificationData['title'],
        notificationData['note'],
        scheduledDate,
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload:
            notiId, // ใช้ notiId เป็น payload เพื่อระบุการแจ้งเตือนแต่ละครั้ง
        matchDateTimeComponents:
            DateTimeComponents.time, // ระบุเฉพาะเวลาที่ต้องการให้แจ้งเตือน
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.titleNoti,
          style: TextStyle(
            color: brown, // Assuming 'brown' is a defined color variable
            fontFamily: 'Garuda',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: brown,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: addNotiScreen(
                    userId: widget.userId,
                    titleNoti: widget.titleNoti,
                    labelNotiText: widget.labelNotiText,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );
  }
}
