import 'dart:convert';
import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_reminders/controller/plugin.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

import '../pages/lanrelog/home.dart';

class APIEndpoint {
  /*static Future<bool> login(
      BuildContext context, String email, String password) async {
    var url = 'https://n30apiapp.000webhostapp.com/PJ_data/login.php';
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data['message']);

        // ตรวจสอบว่าการเข้าสู่ระบบสำเร็จหรือไม่
        if (data['message'] == 'Login successful') {
          // สามารถเข้าสู่ระบบได้
          SessionManagerPlugin.isLoggedIn = true;
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: homePage(),
            ),
          );
          return true;
        } else {
          // ไม่สามารถเข้าสู่ระบบได้
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Incorrect email or password'),
              duration: Duration(seconds: 3),
            ),
          );
          return false;
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }*/

  static Future<bool> singIn(
      BuildContext context, String email, String password) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: homePage(),
        ),
      );

      return true;
    } on Exception catch (e) {
      // TODO
      print("singIn Err : $e");
      return false;
    }
  }
}
