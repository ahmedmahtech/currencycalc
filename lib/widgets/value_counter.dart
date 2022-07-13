import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Center valueCounter(
    RxString ammount,
    RxString selectedFrom,
    RxString selectedTo,
    RxDouble selectedPrice,
    ) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        color:  Colors.black.withOpacity(0.05),
        borderRadius:  BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding:  EdgeInsets.all(5),
        child: Obx(
              () => Text(
            ammount.value.isEmpty
                ? '0,00 $selectedFrom = 0,00 $selectedTo'
                : '${(double.parse(ammount.value.replaceAll(',', '.')).toStringAsFixed(2)).replaceAll('.', ',')} $selectedFrom = ${(double.parse(ammount.value.replaceAll(',', '.')) * selectedPrice.value).toStringAsFixed(2).replaceAll('.', ',')} $selectedTo',
            style: GoogleFonts.lato(
              color:  Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
            ),
          ),
        ),
      ),
    ),
  );
}