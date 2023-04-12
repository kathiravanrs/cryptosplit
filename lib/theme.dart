import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primaryColor: const Color(0xFF3485FF),
    accentColor: const Color(0xFFFDC300),
    backgroundColor: const Color(0xFFF4F4F4),
    textTheme: GoogleFonts.montserratTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
