import 'dart:math';

class Calculate {
  static double arithmeticResult(List values) {
    double result = 0;
    if (values.isNotEmpty) {
      double total = 0;
      for (var i = 0; i < values.length; i++) {
        total += values[i].value;
      }
      result = total / values.length;
    }
    return result;
  }

  static num geometricResult(List value) {
    num result = 0.0;
    num total = 1;
    for (var i = 0; i < value.length; i++) {
      total *= value[i].value;
    }
    result = pow(total, 1 / value.length);
    return result;
  }

  static num harmonicResult(List value) {
    num result = 0.0;
    double total = 0;
    for (var i = 0; i < value.length; i++) {
      total += 1 / value[i].value;
    }
    result = value.length / total;
    return result;
  }

  static num medianResult(List value) {
    num result = 0;
    List<double> _valueSortList = [];
    int lenght = value.length;
    for (var i = 0; i < lenght; i++) {
      _valueSortList.add(value[i].value);
    }
    _valueSortList.sort();
    if (lenght % 2 == 0) {
      var one = _valueSortList[lenght ~/ 2 - 1];
      var two = _valueSortList[(lenght + 1) ~/ 2];
      result = (one + two) / 2;
    } else {
      result = _valueSortList[(lenght + 1) ~/ 2 - 1];
    }
    return result;
  }
}
