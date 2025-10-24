import 'package:flutter/material.dart';

class ButtonGo extends StatelessWidget {
  final String path;
  final IconData icon;

  const ButtonGo({super.key, required this.path, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, path);
      },
      icon: Icon(icon),
    );
  }
}
