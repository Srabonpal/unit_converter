# Unit Converter App — Flutter + Provider

A Flutter unit converter assignment with a clean blue UI inspired by the supplied reference screenshot.

## Features
- Length, Weight and Temperature conversion
- Numeric input field with real-time calculation
- From and To dropdown menus
- Swap button
- Result card with unit symbol
- Provider state management (`ChangeNotifierProvider`, `ChangeNotifier`, `context.watch`, `context.read`)
- Organized code structure

## Supported units

**Length:** Meter, Kilometer, Centimeter, Millimeter, Mile, Foot, Inch, Yard

**Weight:** Kilogram, Gram, Milligram, Pound, Ounce, Metric Ton

**Temperature:** Celsius, Fahrenheit, Kelvin

## Run
```bash
flutter pub get
flutter run
```

## Example
Value: `10` | From: `Kilometer` | To: `Meter` | Result: `10000 m`

## Project structure
```text
lib/
├── data/
│   └── unit_data.dart
├── models/
│   ├── conversion_type.dart
│   └── unit.dart
├── providers/
│   └── converter_provider.dart
├── screens/
│   └── converter_screen.dart
├── services/
│   └── conversion_service.dart
├── widgets/
│   └── unit_dropdown.dart
└── main.dart
```

## Upload to GitHub
```bash
git init
git add .
git commit -m "Unit Converter app using Provider"
git branch -M main
git remote add origin YOUR_GITHUB_REPOSITORY_URL
git push -u origin main
```
