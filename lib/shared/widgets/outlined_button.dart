import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}