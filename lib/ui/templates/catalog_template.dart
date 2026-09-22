import 'package:flutter/material.dart';

class CatalogTemplate extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget searchSection;
  final Widget catalogSection;
  final Widget divider;
  final Widget formSection;

  const CatalogTemplate({
    super.key,
    required this.appBar,
    required this.searchSection,
    required this.catalogSection,
    required this.divider,
    required this.formSection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchSection,
            const SizedBox(height: 16),
            catalogSection,
            divider,
            formSection,
          ],
        ),
      ),
    );
  }
}
