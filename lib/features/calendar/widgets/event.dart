import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String dateRange;
  final Widget avatar; // Cambiado de IconData a Widget

  const EventCard({super.key, required this.title, required this.dateRange, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          avatar, // Aquí utilizamos el avatar
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
            onPressed: () {
              // Acción de "Ver más"
            },
            child: const Text("Ver más"),
          ),
        ],
      ),
    );
  }
}
