import 'package:flutter/material.dart';

import '../models/unit.dart';

class UnitDropdown extends StatelessWidget {
  final Unit value;
  final List<Unit> units;
  final ValueChanged<Unit?> onChanged;

  const UnitDropdown({
    super.key,
    required this.value,
    required this.units,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Unit>(
      value: value,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF35445C)),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      ),
      items: units.map((unit) {
        return DropdownMenuItem<Unit>(
          value: unit,
          child: Text(
            unit.name,
            style: const TextStyle(
              color: Color(0xFF26364D),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
