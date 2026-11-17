import '../models/conversion_type.dart';
import '../models/unit.dart';

class UnitData {
  static const Map<ConversionType, List<Unit>> units = {
    ConversionType.length: [
      Unit(name: 'Meter', symbol: 'm', type: ConversionType.length),
      Unit(name: 'Kilometer', symbol: 'km', type: ConversionType.length),
      Unit(name: 'Centimeter', symbol: 'cm', type: ConversionType.length),
      Unit(name: 'Millimeter', symbol: 'mm', type: ConversionType.length),
      Unit(name: 'Mile', symbol: 'mi', type: ConversionType.length),
      Unit(name: 'Foot', symbol: 'ft', type: ConversionType.length),
      Unit(name: 'Inch', symbol: 'in', type: ConversionType.length),
      Unit(name: 'Yard', symbol: 'yd', type: ConversionType.length),
    ],
    ConversionType.weight: [
      Unit(name: 'Kilogram', symbol: 'kg', type: ConversionType.weight),
      Unit(name: 'Gram', symbol: 'g', type: ConversionType.weight),
      Unit(name: 'Milligram', symbol: 'mg', type: ConversionType.weight),
      Unit(name: 'Pound', symbol: 'lb', type: ConversionType.weight),
      Unit(name: 'Ounce', symbol: 'oz', type: ConversionType.weight),
      Unit(name: 'Metric Ton', symbol: 't', type: ConversionType.weight),
    ],
    ConversionType.temperature: [
      Unit(name: 'Celsius', symbol: '°C', type: ConversionType.temperature),
      Unit(name: 'Fahrenheit', symbol: '°F', type: ConversionType.temperature),
      Unit(name: 'Kelvin', symbol: 'K', type: ConversionType.temperature),
    ],
  };
}
