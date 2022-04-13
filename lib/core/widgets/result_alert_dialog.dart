import 'package:flutter/material.dart';

class ResultAlertDialog extends StatelessWidget {
  final String result;
  const ResultAlertDialog({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget noButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Çıkış"),
    );
    return AlertDialog(
      title: const Text(
        "Aritmetik Ortalama Sonucu",
        textAlign: TextAlign.center,
      ),
      content: Text(
        result,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      actions: [noButton],
    );
  }
}
