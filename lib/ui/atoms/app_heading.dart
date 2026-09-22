import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  final String text;

  const AppHeading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
