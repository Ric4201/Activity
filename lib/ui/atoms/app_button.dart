import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final bool isFullWidth;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.padding,
    this.isFullWidth = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        padding: padding,
      ),
      child: Text(
        label,
        style: textStyle,
      ),
    );

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}
