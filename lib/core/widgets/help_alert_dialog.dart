import 'package:flutter/material.dart';

class HelpAlertDialog extends StatelessWidget {
  final String imagePath;
  final String description;
  const HelpAlertDialog(
      {Key? key, required this.imagePath, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Formül ve Kullanım ",
        textAlign: TextAlign.center,
      ),
      content: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/' + imagePath + '.png',
                fit: BoxFit.fill,
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
