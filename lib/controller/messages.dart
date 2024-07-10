import 'package:flutter/material.dart';

warningMessage({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(
        seconds: 2,
      ),
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
  );
}

successMessage({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(
        seconds: 2,
      ),
      backgroundColor: const Color.fromARGB(255, 42, 128, 45),
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
