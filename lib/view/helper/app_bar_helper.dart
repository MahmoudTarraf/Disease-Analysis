import 'package:flutter/material.dart';

class AppBarHelper extends StatelessWidget {
  final String name;
  final Color color;
  final double size;
  const AppBarHelper({
    super.key,
    required this.name,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
