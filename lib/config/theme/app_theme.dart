import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 167, 0, 189);
const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length - 1,
            'Color must be bettwen 0 and ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorTheme[selectedColor]);
  }
}
