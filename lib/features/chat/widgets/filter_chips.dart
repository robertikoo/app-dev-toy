import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          FilterChip(
            label: const Text('Recientes'),
            onSelected: (selected) {},
          ),
          FilterChip(
            label: const Text('Ayer'),
            onSelected: (selected) {},
          ),
          FilterChip(
            label: const Text('No leídos'),
            onSelected: (selected) {},
          ),
        ],
      ),
    );
  }


}
