import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';

final ButtonStyle buttonone = ElevatedButton.styleFrom(
  minimumSize: Size(281, 55),
  primary: yellow,
  //elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  shadowColor: brown,
  elevation: 1,
);

final ButtonStyle buttontwo = ElevatedButton.styleFrom(
  minimumSize: Size(281, 55),
  primary: white,
  //elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    side: BorderSide(color:brown),
  ),
  shadowColor: brown,
  elevation: 1,
);