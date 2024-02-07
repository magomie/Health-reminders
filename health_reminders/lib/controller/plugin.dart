import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavigationPlugin {
  static void goToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: page,
      ),
    );
  }
}
