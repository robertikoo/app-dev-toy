import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../shared/layouts/main_layout.dart'; // Importando el layout principal

class CuidadoEsporadicoWidget extends StatefulWidget {
  const CuidadoEsporadicoWidget({super.key});

  @override
  _CuidadoEsporadicoWidgetState createState() =>
      _CuidadoEsporadicoWidgetState();
}

class _CuidadoEsporadicoWidgetState extends State<CuidadoEsporadicoWidget> {
  bool isDondeExpanded = false;
  bool isCuandoExpanded = false;
  String selectedCuando = "Semana";
  DateTime? selectedDate;
  final List<String> cuandoOptions = [
    "Semana",
    "Fin de semana",
    "Día específico"
  ];

  final List<DateTime> markedDates = [
    DateTime(2025, 2, 4),
    DateTime(2025, 2, 5),
    DateTime(2025, 2, 6),
  ];

  @override
  Widget build(BuildContext context) {
  return MainLayout( // Usando el MainLayout sin el parámetro 'title'
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 16), // Espacio entre el encabezado y el contenido
            _buildDropdownButton(
                Icons.location_on, "Dónde", "Salitrera B, Copiapó", [
              "Salitrera Bellavista, Copiapó",
              "Salitrera Santa Ana, Copiapó",
              "Salitrera Independencia, Copiapó",
              "Salitrera Estadio, Copiapó"
            ]),
            const SizedBox(height: 16), // Aquí agregamos el espacio entre "Dónde" y "Cuando"
            _buildDropdownCuando(),
            const SizedBox(height: 16), // Aumenta el espacio aquí para separar más el "Cuando"
            if (isCuandoExpanded) _buildCalendarDropdown(),
            _buildOptionButton(Icons.access_time, "Hora", "Inicio - término"),
            _buildOptionButton(
                Icons.person, "Para quién", "Agregar niño o niña"),
            _buildOptionButton(Icons.edit, "Agregar nota", "Opcional"),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                child: Stack(
                  children: [
                    Text(
                      "Solicitar Cuidado",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                      ),
                    ),
                    const Text(
                      "Solicitar Cuidado",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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


  Widget _buildDropdownCuando() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCuandoExpanded = !isCuandoExpanded;
        });
      },
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
                Icon(Icons.calendar_today, color: Colors.black54),
                const SizedBox(width: 8),
                Text("Cuándo", style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Text(selectedCuando, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
Widget _buildCalendarDropdown() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // Frase agregada antes del calendario
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "¿",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: "Cuándo",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " deseas tu cuidado?",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),

            TableCalendar(
              calendarFormat: CalendarFormat.month, // Asegura que muestre el mes completo

              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: (day) {
                return markedDates.contains(day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDate = selectedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                outsideDaysVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (day.day == 4 && day.month == 2 && day.year == 2025 ||
                      day.day == 5 && day.month == 2 && day.year == 2025 ||
                      day.day == 6 && day.month == 2 && day.year == 2025) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),

            // Botón "Siguiente" de ancho completo
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Acción cuando se presiona el botón
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Siguiente"),
              ),
            ),
          ],
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
