import 'package:flutter/material.dart';

class NoteOptionButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function(String)? onNoteChanged;

  const NoteOptionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onNoteChanged,
  });

  @override
  State<NoteOptionButton> createState() => _NoteOptionButtonState();
}

class _NoteOptionButtonState extends State<NoteOptionButton> {
  bool isExpanded = false;
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
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
                    Icon(widget.icon, color: Colors.black54),
                    const SizedBox(width: 8),
                    Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(widget.subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isExpanded ? 120 : 0,
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
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Agregar nota...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                maxLines: 3,
                onChanged: widget.onNoteChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
} 