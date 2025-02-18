import 'package:flutter/material.dart';

class SearchCard extends StatefulWidget {
  final Function(String) onSearchChanged;

  const SearchCard({required this.onSearchChanged, super.key});

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Center(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Asegura que todo esté centrado
            children: [
              // Icono de lupa
              Icon(Icons.search, color: Colors.grey[600]),
              const SizedBox(width: 8), // Espacio entre el icono y el texto

              // Stack para manejar el texto de hint y el TextField
              Container(
                width:
                    200, // Asegura un ancho para que el texto y la lupa se alineen bien
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    // El texto que aparece cuando el TextField está vacío
                    _controller.text.isEmpty
                        ? RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 18,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'Buscar '),
                                TextSpan(
                                  text: 'cuidado',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic, // Solo "cuidado" en cursiva
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox
                            .shrink(), // Se oculta cuando el usuario empieza a escribir

                    // Campo de texto para la búsqueda
                    TextField(
                      controller: _controller,
                      onChanged: (text) {
                        widget.onSearchChanged(
                            text); // Llamar la función cuando el texto cambie
                      },
                      decoration: InputDecoration(
                        hintText: '',
                        border: InputBorder.none, // Sin borde
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
