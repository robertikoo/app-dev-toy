import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CuidadoEsporadicoWidget extends StatefulWidget {
  const CuidadoEsporadicoWidget({super.key});

  @override
  _CuidadoEsporadicoWidgetState createState() => _CuidadoEsporadicoWidgetState();
}

class _CuidadoEsporadicoWidgetState extends State<CuidadoEsporadicoWidget> {
  bool isDondeExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildDropdownButton(Icons.location_on, "Dónde", "Salitrera B, Copiapó", [
                "Salitrera Bellavista, Copiapó",
                "Salitrera Santa Ana, Copiapó",
                "Salitrera Independencia, Copiapó",
                "Salitrera Estadio, Copiapó"
              ]),
              _buildOptionButton(Icons.calendar_today, "Cuándo", "Semana"),
              _buildOptionButton(Icons.access_time, "Hora", "Inicio - término"),
              _buildOptionButton(Icons.person, "Para quién", "Agregar niño o niña"),
              _buildOptionButton(Icons.edit, "Agregar nota", "Opcional"),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Solicitar Cuidado",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF4C44D4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/cuidado_esporadico.svg',
            height: 50,
          ),
          const SizedBox(width: 8),
          const Text(
            "Cuidado Esporádico",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(IconData icon, String title, String selected, List<String> options) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isDondeExpanded = !isDondeExpanded),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.black54),
                    const SizedBox(width: 8),
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(selected, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
        if (isDondeExpanded)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: options.map((option) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(option, style: const TextStyle(color: Colors.grey)),
                ),
              )).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildOptionButton(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
