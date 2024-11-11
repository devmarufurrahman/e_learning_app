import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

FlutterSliderTooltip CustomSliderToolTip() {
  return FlutterSliderTooltip(
    textStyle: TextStyle(
      fontSize: 12,
      fontFamily: AppFonts.AVENIR,
      color: kPrimaryColor,
      fontWeight: FontWeight.w500,
    ),
    boxStyle: FlutterSliderTooltipBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kSecondaryColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3.83),
            blurRadius: 5.74,
            spreadRadius: -1.91,
            color: kTertiaryColor.withOpacity(0.1),
          ),
          BoxShadow(
            offset: Offset(0, 11.48),
            blurRadius: 15.3,
            spreadRadius: -3.83,
            color: kTertiaryColor.withOpacity(0.1),
          ),
        ],
      ),
    ),
  );
}
