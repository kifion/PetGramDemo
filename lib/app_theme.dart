import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],
    accentColor: Colors.cyan[600],
    // Define the default font family.
    fontFamily: 'CircularXX',
  );
}