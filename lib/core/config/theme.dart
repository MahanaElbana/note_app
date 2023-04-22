import 'package:flutter/material.dart';

class Style {
  static ThemeData darkTheme = ThemeData(
    
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ),
      );
}
