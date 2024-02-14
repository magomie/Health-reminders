import 'package:flutter/material.dart';
import 'package:health_reminders/controller/endpoin.dart';

class UserOperator {
  static Future<bool> login(
      BuildContext context, String email, String password) async {
    final bool success = await APIEndpoint.signIn(context, email, password);

    return success;
  }

  static Future<bool> signUp(BuildContext context, String email,
      String password, String passwordConf) async {
    if (password == passwordConf) {
      final bool success = await APIEndpoint.signIn(context, email, password);
      return success;
    } else {
      return false;
    }
  }
}
