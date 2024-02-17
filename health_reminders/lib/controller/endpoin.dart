import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_reminders/controller/plugin.dart';
import 'package:health_reminders/pages/lanrelog/gender.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

import '../pages/lanrelog/home.dart';

class APIEndpoint {
  static Future<bool> signIn(
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
          child: homePage(
            userId: userCredential.user!.uid,
          ),
        ),
      );

      return true;
    } on Exception catch (e) {
      // TODO
      print("signIn Err : $e");
      return false;
    }
  }

  static Future<User?> signUp(
      BuildContext context, String email, String password) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on Exception catch (e) {
      // TODO
      print("signUp Err : $e");
      return null;
    }
  }

  static Future<bool> addInfo(
      String userId,
      String email,
      String password,
      String name,
      String gender,
      int age,
      double weight,
      double high,
      int Exe_B) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      await FirebaseFirestore.instance.collection('user').doc(userId).set({
        'username': name,
        'email': email,
        'password': password,
      });
      await FirebaseFirestore.instance.collection('info').doc(userId).set({
        'userId': userId,
        'gender': gender,
        'age': age,
        'weight': weight,
        'high': high,
        'Exe_B': Exe_B
      });

      return true;
    } on Exception catch (e) {
      print("err : $e");
      return false;
    }
  }
}
