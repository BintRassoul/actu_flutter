import 'package:flutter/material.dart';
class AppTheme {
  late ThemeData lightTheme;
  late ThemeData darkTheme;

  /// Constructs an [AppTheme].
  AppTheme() {
    lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Inter',
      useMaterial3: true,
    
    );
//-----------------------------DARK THEME----------------------------------
    darkTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Inter',
   
    );
  }
}
