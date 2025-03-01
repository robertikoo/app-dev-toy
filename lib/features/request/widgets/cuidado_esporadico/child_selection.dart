import 'package:flutter/material.dart';

class ChildSelection extends StatefulWidget {
  final String? selectedChild;
  final List<String> childrenOptions;
  final Function(String) onChildSelected;

  const ChildSelection({
    super.key,
    this.selectedChild,
    required this.childrenOptions,
    required this.onChildSelected,
  });

  @override
  State<ChildSelection> createState() => _ChildSelectionState();
}

class _ChildSelectionState extends State<ChildSelection> {
  bool isParaQuienExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isParaQuienExpanded = !isParaQuienExpanded),
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
                    Icon(Icons.person, color: Colors.black54),
                    const SizedBox(width: 8),
                    const Text("Para quién", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(widget.selectedChild ?? "Agregar Niño o Niña", style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isParaQuienExpanded ? 300 : 0,
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
                  RichText(
                    text: const TextSpan(
                      text: "¿Para quién ",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: "deseas tu cuidado?",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...widget.childrenOptions.map((option) => GestureDetector(
                    onTap: () {
                      widget.onChildSelected(option);
                      setState(() => isParaQuienExpanded = false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        option,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
} 