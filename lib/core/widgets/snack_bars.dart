import 'package:flutter/material.dart';

class CustomSnackAlert {
  static SnackBar showErrorSnackBar(String message) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
      dismissDirection: DismissDirection.horizontal,
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
  // ... another snackbar
}
