import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Center numberButton(
    String str, Function(String) changeValue) {
  return Center(
    child: GestureDetector(
      onTap: () => changeValue(str),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        width: 20.w,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.all(5),
            child: Text(
              str,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}