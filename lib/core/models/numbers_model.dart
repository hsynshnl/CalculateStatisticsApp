import 'package:uuid/uuid.dart';

class Value {
  final String id;
  final double value;

  Value({required this.id, required this.value});

  factory Value.create({required double value}) {
    return Value(
      id: const Uuid().v1(),
      value: value,
    );
  }
}
