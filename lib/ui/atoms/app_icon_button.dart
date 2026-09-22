import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double? iconSize;
  final String? tooltip;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.iconSize,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: color, size: iconSize),
      tooltip: tooltip,
    );
  }
}
