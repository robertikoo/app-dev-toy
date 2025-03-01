import 'package:flutter/material.dart';
import '../../../shared/widgets/layout/custom_nav_bar.dart';
import '../widgets/cuidado_esporadico/widgets.dart';

class CuidadoEsporadicoScreen extends StatefulWidget {
  const CuidadoEsporadicoScreen({super.key});

  @override
  _CuidadoEsporadicoScreenState createState() => _CuidadoEsporadicoScreenState();
}

class _CuidadoEsporadicoScreenState extends State<CuidadoEsporadicoScreen> {
  String selectedCuando = "Semana";
  DateTime? selectedDate;
  TimeOfDay? inicio;
  TimeOfDay? termino;
  Duration? duracionTotal;
  String? selectedChild;
  final List<String> childrenOptions = [
    "Martín (2 años, Masculino)", 
    "Sofía (3 años, Femenino)", 
    "Agregar Niño o Niña"
  ];

  final List<DateTime> markedDates = [
    DateTime(2025, 2, 4),
    DateTime(2025, 2, 5),
    DateTime(2025, 2, 6),
  ];

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _onInicioSelected(TimeOfDay time) {
    setState(() {
      inicio = time;
      if (termino != null) {
        duracionTotal = _calcularDuracion(time, termino!);
      }
    });
  }

  void _onTerminoSelected(TimeOfDay time) {
    setState(() {
      termino = time;
      if (inicio != null) {
        duracionTotal = _calcularDuracion(inicio!, time);
      }
    });
  }

  void _onChildSelected(String child) {
    setState(() {
      selectedChild = child;
    });
  }

  Duration _calcularDuracion(TimeOfDay inicio, TimeOfDay termino) {
    return Duration(hours: termino.hour - inicio.hour, minutes: termino.minute - inicio.minute);
  }

  Set<DateTime> selectedDates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const CuidadoHeader(),
              const SizedBox(height: 16),
              const LocationDropdown(),
              const SizedBox(height: 16),
              CalendarDropdown(
                selectedDates: selectedDates,
                onDatesSelected: (dates) {
                  setState(() {
                    selectedDates = dates;
                  });
                },
                markedDates: [],
                selectedCuando: "Selected dates: ${selectedDates.length}",
              ),
              const SizedBox(height: 11),
              TimeSelection(
                inicio: inicio,
                termino: termino,
                duracionTotal: duracionTotal,
                onInicioSelected: _onInicioSelected,
                onTerminoSelected: _onTerminoSelected,
              ),
              const SizedBox(height: 16),
              ChildSelection(
                selectedChild: selectedChild,
                childrenOptions: childrenOptions,
                onChildSelected: _onChildSelected,
              ),
              const SizedBox(height: 16),
              NoteOptionButton(
                icon: Icons.edit,
                title: "Agregar nota",
                subtitle: "Opcional",
              ),
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
} 