import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';

class CustomStyles {
  static TextStyle getStyle(
      {
    required double? fontSize,
    required Color? color,
    required FontWeight? fontWeight,
    required String? locale,
  }) {
    if (locale == "ar") {
      return GoogleFonts.cairo(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,

        ),
      );
    } else {
      return GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
      );
    }
  }
}


/*
 //////////////////////// HOW TO USE ///////////////////////
 1 - import 'components/custom_text_styles.dart';
 2- ////////////////////FOR ENGLISH ///////////////////////
 Text("shipment",
        style: CustomStyles.getStyle(
          locale: const Locale('en'),
            fontSize: 25,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700),
        ),
 3 - ////////////////////FOR ARABIC ///////////////////////


 Text("تطبيق النقل",
        style: CustomStyles.getStyle(
          locale: const Locale('ar'),
            fontSize: 25,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700),
        ),

 */