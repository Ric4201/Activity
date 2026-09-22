import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double height;
  final double thickness;

  const AppDivider({
    super.key,
    this.height = 32.0,
    this.thickness = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
    );
  }
}
