import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:currencycalc/widgets/number_button.dart';
import 'package:unicons/unicons.dart';

Padding buttonsGrid(
    Function(String) changeAmmount,
    Function() backspace,
    ) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 5,
      vertical: 5,
    ),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 12,
      itemBuilder: (BuildContext context, int i) {
        if (i == 9) {
          return numberButton(',', changeAmmount);
        } else if (i == 10) {
          return numberButton(0.toString(), changeAmmount);
        } else if (i == 11) {
          return Center(
            child: GestureDetector(
              onTap: () => backspace(),
              child: Container(
                width: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:Colors.blue,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      UniconsLine.backspace,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return numberButton(
            (i + 1).toString(),
            changeAmmount,

          );
        }
      },
    ),
  );
}