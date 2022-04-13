import 'package:flutter/material.dart';

import '../models/numbers_model.dart';
import '../widgets/snack_bars.dart';

class ListAdd {
  static List<Value> listAdd(value, context) {
    List _array = value.trim().split(" ");
    List<Value> _newList = [];
    for (var i = 0; i < _array.length; i++) {
      try {
        _newList.add(Value.create(value: double.parse(_array[i])));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackAlert.showErrorSnackBar("Hatalı girdiniz."));
      }
    }
    _array.clear();
    return _newList;
  }
}
