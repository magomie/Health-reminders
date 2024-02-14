import 'package:flutter/material.dart';
import 'package:health_reminders/controller/endpoin.dart';

class UserOperator {
  static Future<bool> login(
      BuildContext context, String email, String password) async {
    final bool success = await APIEndpoint.singIn(context, email, password);

    return success;
  }
}
