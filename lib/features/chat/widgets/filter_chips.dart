import 'package:flutter/material.dart';

class FilterChips extends StatefulWidget {
  const FilterChips({super.key});

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          FilterChip(
            label: const Text('Recientes'),
            selected: _selectedIndex == 0,
            onSelected: (selected) {
              setState(() {
                _selectedIndex = 0;
              });
            },
            backgroundColor: Colors.transparent,
            selectedColor: Colors.transparent,
            labelStyle: TextStyle(
              color: _selectedIndex == 0 ? Colors.black : Colors.grey[600],
              fontWeight: _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
            ),
            shape: StadiumBorder(
              side: BorderSide(
                color: _selectedIndex == 0 ? Colors.black : Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          FilterChip(
            label: const Text('Ayer'),
            selected: _selectedIndex == 1,
            onSelected: (selected) {
              setState(() {
                _selectedIndex = 1;
              });
            },
            backgroundColor: Colors.grey[200],
            selectedColor: Colors.grey[200],
            labelStyle: TextStyle(
              color: _selectedIndex == 1 ? Colors.black : Colors.grey[600],
              fontWeight: _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
            ),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          FilterChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('No leídos'),
                const SizedBox(width: 4),
                Text('(2)'),
              ],
            ),
            selected: _selectedIndex == 2,
            onSelected: (selected) {
              setState(() {
                _selectedIndex = 2;
              });
            },
            backgroundColor: Colors.grey[200],
            selectedColor: Colors.grey[200],
            labelStyle: TextStyle(
              color: _selectedIndex == 2 ? Colors.black : Colors.grey[600],
              fontWeight: _selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
            ),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ],
      ),
    );
  }
}
