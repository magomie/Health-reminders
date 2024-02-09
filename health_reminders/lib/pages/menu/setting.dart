import 'package:flutter/material.dart';

class settingPage extends StatelessWidget {
  const settingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'This is the setting Page',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
