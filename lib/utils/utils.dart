import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size,[Color color = Colors.black, FontWeight fontWeight = FontWeight.normal]){
  return GoogleFonts.alexandria(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
  );
}