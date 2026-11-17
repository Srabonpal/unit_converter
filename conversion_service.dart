import '../models/conversion_type.dart';
import '../models/unit.dart';

class ConversionService {
  static const Map<String, double> _lengthFactors = {
    'm': 1,
    'km': 1000,
    'cm': 0.01,
    'mm': 0.001,
    'mi': 1609.344,
    'ft': 0.3048,
    'in': 0.0254,
    'yd': 0.9144,
  };

  static const Map<String, double> _weightFactors = {
    'kg': 1000,
    'g': 1,
    'mg': 0.001,
    'lb': 453.59237,
    'oz': 28.349523125,
    't': 1000000,
  };

  static double convert(double value, Unit from, Unit to) {
    if (from.type != to.type) {
      throw ArgumentError('Cannot convert between different categories.');
    }
    if (from.symbol == to.symbol) return value;

    switch (from.type) {
      case ConversionType.length:
        final meters = value * _lengthFactors[from.symbol]!;
        return meters / _lengthFactors[to.symbol]!;
      case ConversionType.weight:
        final grams = value * _weightFactors[from.symbol]!;
        return grams / _weightFactors[to.symbol]!;
      case ConversionType.temperature:
        final celsius = _toCelsius(value, from.symbol);
        return _fromCelsius(celsius, to.symbol);
    }
  }

  static double _toCelsius(double value, String unit) {
    switch (unit) {
      case '°C':
        return value;
      case '°F':
        return (value - 32) * 5 / 9;
      case 'K':
        return value - 273.15;
      default:
        throw ArgumentError('Unsupported temperature unit.');
    }
  }

  static double _fromCelsius(double value, String unit) {
    switch (unit) {
      case '°C':
        return value;
      case '°F':
        return value * 9 / 5 + 32;
      case 'K':
        return value + 273.15;
      default:
        throw ArgumentError('Unsupported temperature unit.');
    }
  }
}
