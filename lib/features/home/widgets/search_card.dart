import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  final ValueChanged<String> onSearchChanged; // Llamado cuando el texto cambia

  const SearchCard({super.key, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: onSearchChanged, // Se llama a onSearchChanged cuando cambia el texto
              decoration: const InputDecoration(
                labelText: 'Buscar...',
                prefixIcon: const Icon(Icons.search), // Icono de lupa
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
