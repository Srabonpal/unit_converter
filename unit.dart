import 'conversion_type.dart';

class Unit {
  final String name;
  final String symbol;
  final ConversionType type;

  const Unit({
    required this.name,
    required this.symbol,
    required this.type,
  });

  @override
  String toString() => name;
}
