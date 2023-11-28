import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size,[Color color = Colors.black, FontWeight fontWeight = FontWeight.normal]){
  return GoogleFonts.alexandria(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
  );
}


void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}