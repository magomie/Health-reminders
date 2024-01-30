import 'package:flutter/material.dart';

class CustomAppBarHaveActions extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onBackButtonPressed;
  final VoidCallback onAddButtonPressed;
  final String title;

  CustomAppBarHaveActions(
      {required this.onBackButtonPressed,
      required this.onAddButtonPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.brown, // Assuming 'brown' is a defined color variable
          fontFamily: 'Garuda',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.brown),
        onPressed: onBackButtonPressed,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            color: Colors.brown,
          ),
          onPressed: onAddButtonPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackButtonPressed;
  final String title;

  CustomAppBar({required this.onBackButtonPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.brown, // Assuming 'brown' is a defined color variable
          fontFamily: 'Garuda',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.brown),
        onPressed: onBackButtonPressed,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
