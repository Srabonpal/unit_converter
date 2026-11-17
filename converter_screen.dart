import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/conversion_type.dart';
import '../providers/converter_provider.dart';
import '../widgets/unit_dropdown.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  late final TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController(text: '25');
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final converter = context.watch<ConverterProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2878E8),
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          'Unit Converter',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 22, 18, 30),
          children: [
            _categoryTabs(converter.type),
            const SizedBox(height: 20),
            const Text('Enter Value', style: _labelStyle),
            const SizedBox(height: 7),
            TextField(
              controller: _inputController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              onChanged: context.read<ConverterProvider>().setInput,
              decoration: const InputDecoration(
                hintText: 'Enter a value',
                contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
              ),
            ),
            const SizedBox(height: 22),
            const Text('From', style: _labelStyle),
            const SizedBox(height: 7),
            UnitDropdown(
              value: converter.from,
              units: converter.availableUnits,
              onChanged: context.read<ConverterProvider>().setFrom,
            ),
            const SizedBox(height: 12),
            Center(
              child: Material(
                color: const Color(0xFF2878E8),
                elevation: 4,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: context.read<ConverterProvider>().swap,
                  child: const SizedBox(
                    width: 48,
                    height: 48,
                    child: Icon(Icons.swap_horiz, color: Colors.white, size: 29),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text('To', style: _labelStyle),
            const SizedBox(height: 7),
            UnitDropdown(
              value: converter.to,
              units: converter.availableUnits,
              onChanged: context.read<ConverterProvider>().setTo,
            ),
            const SizedBox(height: 22),
            _resultCard(converter),
          ],
        ),
      ),
    );
  }

  Widget _categoryTabs(ConversionType selected) {
    return Container(
      height: 42,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFFD9E1EF)),
        boxShadow: const [
          BoxShadow(color: Color(0x10000000), blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: ConversionType.values.map((type) {
          final active = selected == type;
          return Expanded(
            child: GestureDetector(
              onTap: () => context.read<ConverterProvider>().setType(type),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: active ? const Color(0xFF2878E8) : Colors.transparent,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  type.label,
                  style: TextStyle(
                    color: active ? Colors.white : const Color(0xFF35445C),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _resultCard(ConverterProvider converter) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 13, 14, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFFE0E6F0)),
        boxShadow: const [
          BoxShadow(color: Color(0x18000000), blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Result:', style: TextStyle(color: Color(0xFF66758C), fontSize: 13)),
          const Divider(height: 17, color: Color(0xFFDCE3EE)),
          if (converter.error != null)
            Center(
              child: Text(converter.error!, style: const TextStyle(color: Colors.redAccent)),
            )
          else
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Color(0xFF2878E8),
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                    TextSpan(text: converter.formattedResult),
                    TextSpan(
                      text: ' ${converter.to.symbol}',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

const _labelStyle = TextStyle(
  color: Color(0xFF66758C),
  fontSize: 13,
  fontWeight: FontWeight.w500,
);
