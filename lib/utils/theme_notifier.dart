import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  final bool isDark;

  ThemeNotifier(this.isDark) : super(isDark ? _darkTheme : _lightTheme);

  ThemeData setLightTheme() => state = _lightTheme;
  ThemeData setDarkTheme() => state = _darkTheme;

  static final _darkTheme = ThemeData(
    primarySwatch: Colors.amber,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    indicatorColor: Colors.amber,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.amber,
    accentIconTheme: const IconThemeData(color: Colors.amberAccent),
    dividerColor: Colors.white54,
  );

  static final _lightTheme = ThemeData(
    primarySwatch: Colors.teal,
    primaryColor: Colors.teal[800],
    indicatorColor: Colors.teal,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.teal,
    accentIconTheme: const IconThemeData(color: Colors.tealAccent),
    dividerColor: Colors.grey,
  );
}
