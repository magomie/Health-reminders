import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_reminders/controller/endpoin.dart';
import 'package:health_reminders/pages/lanrelog/gender.dart';
import 'package:health_reminders/pages/lanrelog/home.dart';
import 'package:page_transition/page_transition.dart';

class UserOperator {
  static Future<bool> login(
      BuildContext context, String email, String password) async {
    final bool success = await APIEndpoint.signIn(context, email, password);
    return success;
  }

  static Future<void> newSignUp(BuildContext context, String email,
      String password, String passwordConf) async {
    try {
      if (password == passwordConf) {
        User? user = await APIEndpoint.signUp(context, email, password);
        if (user != null) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: genderPage(
                userId: user.uid,
                email: email,
                password: password,
              ),
            ),
          );
        }
      } else {}
    } on Exception catch (e) {
      print("err : $e");
    }
  }

  static Future<void> addInfo(
      BuildContext context,
      String email,
      String password,
      String userId,
      String name,
      String gender,
      int age,
      double weight,
      double high,
      int Exe_B) async {
    final success = await APIEndpoint.addInfo(
        userId, email, password, name, gender, age, weight, high, Exe_B);

    final bool successLoc = await APIEndpoint.signIn(context, email, password);

    if (success && successLoc) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: homePage(
            userId: userId,
          ),
        ),
      );
    }
  }
}
