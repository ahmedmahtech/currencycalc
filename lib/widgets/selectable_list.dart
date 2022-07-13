import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
List<String> currencies = [
  "USD",
  "NIS",
  "JD",
  "EUR",
];
Center selectableList(String value, bool isFrom,
    Function(bool, String) changeCurr) {
  return Center(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(10.0),
        color:  Color(0xfff8f8f8),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      width: 35.w,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: const Text(
            'Select',
          ),
          menuMaxHeight: 40.h,
          dropdownColor:  Color(0xfff8f8f8),
          borderRadius: BorderRadius.circular(10),
          style: GoogleFonts.poppins(color: Colors.black),
          value: value,
          items: currencies.map(
                (String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (String? value) {
            changeCurr(isFrom, value.toString());
          },
        ),
      ),
    ),
  );
}