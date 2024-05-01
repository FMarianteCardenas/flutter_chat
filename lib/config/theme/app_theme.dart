import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF2a9d8f);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.blueAccent
];

class AppTheme {
  //declaracion de variable
  final int selectedColor;

  //constructor
  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length -1,
            'Colors must be between 0 and ${_colorThemes.length -1}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: _colorThemes[selectedColor],
        //brightness: Brightness.dark    
    );
  }
}
