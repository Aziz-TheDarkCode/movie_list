import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String _value;
  const Tag({super.key, required value}) : _value = value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF262A34), // Tag background color

        borderRadius: BorderRadius.circular(90), // Added border radius here
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(_value.trim(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
