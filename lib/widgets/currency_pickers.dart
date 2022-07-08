import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:currencycalc/widgets/selectable_list.dart';
import 'package:unicons/unicons.dart';

Padding currencyPickers(
    RxString selectedFrom,
    RxString selectedTo,
    Function() switchCurrencies,
    Function(bool, String) changeSelected,
    ThemeData themeData,
    ) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.0.h),
    child: Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          selectableList(selectedFrom.value, true, changeSelected, themeData),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: GestureDetector(
              onTap: () => switchCurrencies(),
              child: Icon(
                UniconsLine.exchange_alt,
                color: themeData.secondaryHeaderColor,
                size: 22.sp,
              ),
            ),
          ),
          selectableList(selectedTo.value, false, changeSelected, themeData),
        ],
      ),
    ),
  );
}