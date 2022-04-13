import 'package:uuid/uuid.dart';

class BarChartModels {
  final String id;
  final String name;
  final int value;

  BarChartModels({required this.id, required this.name, required this.value});

  factory BarChartModels.create({required int value, required String name}) {
    return BarChartModels(
      id: const Uuid().v1(),
      value: value,
      name: name,
    );
  }
}
