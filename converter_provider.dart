import 'package:flutter/foundation.dart';

import '../data/unit_data.dart';
import '../models/conversion_type.dart';
import '../models/unit.dart';
import '../services/conversion_service.dart';

class ConverterProvider extends ChangeNotifier {
  ConversionType _type = ConversionType.length;
  String _input = '25';
  late Unit _from;
  late Unit _to;
  double? _result;
  String? _error;

  ConverterProvider() {
    final list = UnitData.units[_type]!;
    _from = list[0];
    _to = list[1];
    _calculate();
  }

  ConversionType get type => _type;
  String get input => _input;
  Unit get from => _from;
  Unit get to => _to;
  double? get result => _result;
  String? get error => _error;
  List<Unit> get availableUnits => UnitData.units[_type]!;

  void setType(ConversionType type) {
    if (_type == type) return;
    _type = type;
    final list = availableUnits;
    _from = list[0];
    _to = list[1];
    _calculate();
    notifyListeners();
  }

  void setInput(String value) {
    _input = value;
    _calculate();
    notifyListeners();
  }

  void setFrom(Unit? unit) {
    if (unit == null) return;
    _from = unit;
    _calculate();
    notifyListeners();
  }

  void setTo(Unit? unit) {
    if (unit == null) return;
    _to = unit;
    _calculate();
    notifyListeners();
  }

  void swap() {
    final oldFrom = _from;
    _from = _to;
    _to = oldFrom;
    _calculate();
    notifyListeners();
  }

  void _calculate() {
    final value = double.tryParse(_input.trim());
    if (value == null) {
      _result = null;
      _error = _input.trim().isEmpty ? null : 'Enter a valid number';
      return;
    }
    try {
      _result = ConversionService.convert(value, _from, _to);
      _error = null;
    } catch (_) {
      _result = null;
      _error = 'Conversion error';
    }
  }

  String get formattedResult {
    if (_result == null) return '—';
    if (_result!.isInfinite || _result!.isNaN) return 'Invalid';
    if (_result == _result!.roundToDouble()) {
      return _result!.toStringAsFixed(0);
    }
    return _result!.toStringAsPrecision(8)
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }
}
