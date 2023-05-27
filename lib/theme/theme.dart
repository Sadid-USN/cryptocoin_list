import 'package:flutter/material.dart';

const mycolor = MaterialColor(
  0xFF1F172E,
  <int, Color>{
    50: Color(0xFFE3E1E9),
    100: Color(0xFFB7B4C8),
    200: Color(0xFF8681A8),
    300: Color(0xFF565187),
    400: Color(0xFF2E2B67),
    500: Color(0xFF1F172E),
    600: Color(0xFF1B132A),
    700: Color(0xFF160F24),
    800: Color(0xFF110A1F),
    900: Color(0xFF0A0513),
  },
);

final darkTheme = ThemeData(
  
  scaffoldBackgroundColor: const Color.fromARGB(255, 2, 93, 87),
  primarySwatch: mycolor,
  dividerColor: Colors.grey,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    backgroundColor: Color.fromARGB(255, 31, 23, 46),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
     titleLarge: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 25,
    ),
    labelLarge: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    labelMedium: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 1.5,
    ),
    labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.5),
    headlineMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
  ),
);
