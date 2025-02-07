import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String dateRange;
  final Widget avatar;
  final VoidCallback onTap; // Agregar esta propiedad

  const EventCard({
    super.key,
    required this.title,
    required this.dateRange,
    required this.avatar,
    required this.onTap, // Hacerlo obligatorio
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Usar GestureDetector para detectar toques
      onTap: onTap, // Asignar la función onTap
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            avatar,
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(dateRange, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            TextButton(
              onPressed: onTap, // Usar la misma acción para "Ver más"
              child: const Text("Ver más"),
            ),
          ],
        ),
      ),
    );
  }
}
