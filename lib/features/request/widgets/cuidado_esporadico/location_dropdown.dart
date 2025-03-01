import 'package:flutter/material.dart';

class LocationDropdown extends StatefulWidget {
  const LocationDropdown({super.key});

  @override
  State<LocationDropdown> createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  bool isDondeExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isDondeExpanded = !isDondeExpanded),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.black54),
                    const SizedBox(width: 8),
                    const Text("Dónde", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const Text("Salitrera B, Copiapó", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
        
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isDondeExpanded ? 200 : 0,
          curve: Curves.easeInOut,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Salitrera Bellavista, Copiapó",
                  "Salitrera Santa Ana, Copiapó",
                  "Salitrera Independencia, Copiapó",
                  "Salitrera Estadio, Copiapó"
                ].map((option) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    option,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
} 