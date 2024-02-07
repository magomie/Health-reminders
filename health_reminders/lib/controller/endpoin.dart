import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

import '../pages/lanrelog/home.dart';

class APIEndpoint {
  static final String url =
      'https://n30apiapp.000webhostapp.com/PJ_data/login.php';

  static Future<bool> login(
      BuildContext context, String email, String password) async {
    final response = await http.post(
      Uri.parse(url),
      body: {'Email': email, 'Password': password},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'success') {
        // Successful login
        Navigator.pushReplacementNamed(context, '/home');
        return true; // Return true to indicate successful login
      } else {
        // Failed login, show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid email or password'),
        ));
        return false; // Return false to indicate failed login
      }
    } else {
      // Handle server error
      print('Error: ${response.statusCode}');
      return false; // Return false to indicate failed login
    }
  }
}
