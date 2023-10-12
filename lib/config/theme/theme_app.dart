

import 'package:flutter/material.dart';

Color _customColor = const Color(0xFF49149F);

List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class ThemeApp {
  final int selectedColor;

  ThemeApp({this.selectedColor=0}): assert(selectedColor >= 0 && selectedColor <= _colorTheme.length-1, "el indice de color debe ser un valor mayor que cero y menor que ${_colorTheme.length} ");

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      //brightness: Brightness.dark
    );
  }
  
}