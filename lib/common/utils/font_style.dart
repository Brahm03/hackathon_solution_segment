import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle(
    {double? size = 14,
      Color color = Colors.black,
      FontWeight weight = FontWeight.normal,TextDecoration? decoration}) {
  return GoogleFonts.inter(fontSize: size, color: color, fontWeight: weight,decoration: decoration);
}
