enum ConversionType { length, weight, temperature }

extension ConversionTypeX on ConversionType {
  String get label {
    switch (this) {
      case ConversionType.length:
        return 'Length';
      case ConversionType.weight:
        return 'Weight';
      case ConversionType.temperature:
        return 'Temp';
    }
  }
}
