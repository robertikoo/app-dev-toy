import 'package:flutter/material.dart';
import '../../home/widgets/recomendation_card.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sección de Perfil
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[400],
                  child: const Icon(Icons.image, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Marcela González",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Text("29 años", style: TextStyle(fontSize: 14)),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.school, size: 16),
                          SizedBox(width: 5),
                          Text("Educadora de párvulos"),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(Icons.work, size: 16),
                          SizedBox(width: 5),
                          Text("2 años de experiencia"),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(Icons.location_on, size: 16),
                          SizedBox(width: 5),
                          Text("Copiapó, Atacama"),
                        ],
                      ),
                    ],
                  ),
                ),
                const Column(
                  children: [
                    Text("4.5 ⭐", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Calificación", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Sección de Biografía
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.article, size: 20),
                  SizedBox(width: 5),
                  Text(
                    "Biografía",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Editar"),
              ),
            ],
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 20),

          // Sección de Recomendaciones
          const Row(
            children: [
              Icon(Icons.star_border, size: 20),
              SizedBox(width: 5),
              Text(
                "Recomendaciones",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Lista de recomendaciones
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                RecommendationCard(
                  name: "Mónica Jiménez",
                  comment:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  rating: 4,
                ),
                RecommendationCard(
                  name: "Luis Hidalgo",
                  comment: "Buena profesional. Recomendada.",
                  rating: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
