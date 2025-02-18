import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../shared/layouts/main_layout.dart'; // Importando el layout principal

class CuidadoEsporadicoWidget extends StatefulWidget {
  const CuidadoEsporadicoWidget({super.key});

  @override
  _CuidadoEsporadicoWidgetState createState() => _CuidadoEsporadicoWidgetState();
}

class _CuidadoEsporadicoWidgetState extends State<CuidadoEsporadicoWidget> {
  bool isDondeExpanded = false;
  bool isCuandoExpanded = false;
  bool isHoraExpanded = false;

  String selectedCuando = "Semana";
  DateTime? selectedDate;
  TimeOfDay? inicio;
  TimeOfDay? termino;
  Duration? duracionTotal;

  final List<String> cuandoOptions = ["Semana", "Fin de semana", "Día específico"];
  final List<DateTime> markedDates = [
    DateTime(2025, 2, 4),
    DateTime(2025, 2, 5),
    DateTime(2025, 2, 6),
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              // Comentamos el primer rectángulo redundante
              // _buildDropdownButton(Icons.location_on, "Dónde", "Salitrera B, Copiapó", [
              //   "Salitrera Bellavista, Copiapó",
              //   "Salitrera Santa Ana, Copiapó",
              //   "Salitrera Independencia, Copiapó",
              //   "Salitrera Estadio, Copiapó"
              // ]),
              const SizedBox(height: 16),
              _buildDropdownDonde(), // Este es el rectángulo que debe aparecer correctamente
              const SizedBox(height: 16),
              _buildDropdownCuando(),
              const SizedBox(height: 16),
              if (isCuandoExpanded) _buildCalendarDropdown(),
              _buildHoraSelector(),
              _buildOptionButton(Icons.person, "Para quién", "Agregar niño o niña"),
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

  // Este es el widget para el contenedor "Dónde"
  Widget _buildDropdownDonde() {
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
        // El rectángulo que lista las opciones de lugares, se muestra solo si isDondeExpanded es verdadero
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
              children: [
                "Salitrera Bellavista, Copiapó",
                "Salitrera Santa Ana, Copiapó",
                "Salitrera Independencia, Copiapó",
                "Salitrera Estadio, Copiapó"
              ].map((option) => Padding(
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

  // Header de la pantalla
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

  // Este método construye un botón que se usará para el desplegable de opciones
  Widget _buildOptionButton(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  // Este método gestiona la selección de hora de inicio
  Future<void> _seleccionarHoraInicio() async {
    TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        inicio = picked;
        if (termino != null) {
          duracionTotal = _calcularDuracion(inicio!, termino!);
        }
      });
    }
  }

  // Este método gestiona la selección de hora de término
  Future<void> _seleccionarHoraTermino() async {
    TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        termino = picked;
        if (inicio != null) {
          duracionTotal = _calcularDuracion(inicio!, termino!);
        }
      });
    }
  }

  // Este método calcula la duración total entre las horas de inicio y término
  Duration _calcularDuracion(TimeOfDay inicio, TimeOfDay termino) {
    return Duration(hours: termino.hour - inicio.hour, minutes: termino.minute - inicio.minute);
  }

Widget _buildCalendarDropdown() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black54),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: '¿',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const TextSpan(
                text: 'Cuándo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const TextSpan(
                text: ' deseas tu cuidado?',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
       TableCalendar(
  calendarFormat: CalendarFormat.month,
  focusedDay: DateTime.now(),
  firstDay: DateTime.utc(2020, 1, 1),
  lastDay: DateTime.utc(2025, 12, 31),
  selectedDayPredicate: (day) => markedDates.contains(day),
  onDaySelected: (selectedDay, focusedDay) {
    setState(() {
      selectedDate = selectedDay;
    });
  },
  calendarStyle: const CalendarStyle(
    todayDecoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
    selectedDecoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
  ),
  daysOfWeekStyle: const DaysOfWeekStyle(
    weekendStyle: TextStyle(color: Colors.red),
  ),
  calendarBuilders: CalendarBuilders(
    defaultBuilder: (context, day, focusedDay) {
      if ((day.day == 4 || day.day == 5 || day.day == 6) && day.month == 2 && day.year == DateTime.now().year) {
        return Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey.shade400,  // Color gris para los días 4, 5 y 6 de febrero
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${day.day}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
      return null;
    },
  ),
),
        const SizedBox(height: 16),
        // Expandir el botón a 100% de ancho
        SizedBox(
          width: double.infinity,  // Esto hace que el botón ocupe todo el ancho disponible
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Siguiente",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}


  // Este widget construye el desplegable de "Cuándo"
  Widget _buildDropdownCuando() {
    return GestureDetector(
      onTap: () => setState(() => isCuandoExpanded = !isCuandoExpanded),
      child: _buildOptionButton(Icons.calendar_today, "Cuándo", selectedCuando),
    );
  }

  // Este widget construye el selector de hora de cuidado
  Widget _buildHoraSelector() {
    return GestureDetector(
      onTap: () => setState(() => isHoraExpanded = !isHoraExpanded),
      child: Column(
        children: [
          _buildOptionButton(Icons.access_time, "Hora del cuidado", "Seleccionar horario"),
          if (isHoraExpanded)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildOptionButton(Icons.timer, "Inicio", inicio?.format(context) ?? "Seleccionar", onTap: _seleccionarHoraInicio),
                  _buildOptionButton(Icons.timer_off, "Término", termino?.format(context) ?? "Seleccionar", onTap: _seleccionarHoraTermino),
                  if (duracionTotal != null)
                    _buildOptionButton(Icons.hourglass_bottom, "Total", "${duracionTotal!.inHours} hrs"),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
