import 'package:flutter/material.dart';
import 'package:promina/core/utils/app_color.dart';
import 'package:promina/core/utils/app_fonts.dart';
import 'package:promina/core/utils/app_values.dart';
import 'package:promina/core/utils/font_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    /// colors
    primarySwatch: AppColors.generateMaterialColor(AppColors.btnColor),
    //Divider Color
    dividerColor: AppColors.grey.withOpacity(0.3),

    /// elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 0,
      // foregroundColor: AppColors.teal,
      textStyle: getMediumStyle(
        fontColor: AppColors.white,
        fontSize: FontSize.s15,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20)),
      minimumSize: Size(double.infinity, AppHeight.h45),
    )),

    /// text
    textTheme: TextTheme(
      // big titles
      bodyLarge:
          getBoldStyle(fontColor: AppColors.black, fontSize: FontSize.s16),
      // small titles
      bodyMedium: getSemiBoldStyle(fontColor: AppColors.black),
      // body content grey
      bodySmall: getMediumStyle(fontColor: AppColors.grey),
      // body content primary
      displaySmall: getRegularStyle(fontColor: AppColors.black),
    ),

    /// input decoration
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getRegularStyle(
        fontColor: AppColors.secondGrey.withOpacity(0.7),
      ),
      fillColor: AppColors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(
          vertical: AppHeight.h2, horizontal: AppWidth.w12),
      errorStyle: getRegularStyle(
          fontColor: AppColors.lightRed, fontSize: FontSize.s12),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
          borderSide: const BorderSide(
            color: AppColors.white,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
          borderSide: const BorderSide(
            color: AppColors.white,
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
          borderSide: const BorderSide(
            color: AppColors.white,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
          borderSide: const BorderSide(
            color: AppColors.white,
          )),
    ),
  );
}
