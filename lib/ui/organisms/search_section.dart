import 'package:flutter/material.dart';
import '../atoms/app_heading.dart';
import '../molecules/search_bar_molecule.dart';

class SearchSection extends StatelessWidget {
  final ValueChanged<String> onSearchChanged;

  const SearchSection({
    super.key,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppHeading(text: 'Search Products'),
        const SizedBox(height: 8),
        SearchBarMolecule(onChanged: onSearchChanged),
      ],
    );
  }
}
