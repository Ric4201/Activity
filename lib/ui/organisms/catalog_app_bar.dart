import 'package:flutter/material.dart';

class CatalogAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CatalogAppBar({
    super.key,
    this.title = 'Messy Catalog',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.indigo,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
