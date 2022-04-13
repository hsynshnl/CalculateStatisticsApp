import 'package:flutter/material.dart';

Color cMainColor = Colors.blueGrey;
Text cButtonText(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 18),
  );
}

ButtonStyle cButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateColor.resolveWith(
    (states) => cMainColor,
  ),
  padding: MaterialStateProperty.all(
    const EdgeInsets.all(20),
  ),
);
InputDecoration cInputDecoration = InputDecoration(
  hintText: "Veri Değeri",
  filled: true,
  focusColor: cMainColor,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: cMainColor),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: cMainColor),
  ),
);
Center cTextWidgetListEmpty = const Center(
  child: Text(
    "Liste'de veri yok.",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
  ),
);
