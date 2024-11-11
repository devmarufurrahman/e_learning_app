import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.title,
    required this.subTitle,
    this.marginTop,
  });
  final String? title;
  final String? subTitle;
  final double? marginTop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyText(
          textAlign: TextAlign.center,
          paddingTop: marginTop ?? 35,
          text: title ?? '',
          size: 36,
          paddingBottom: 6,
          lineHeight: 1.2,
          fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
          weight: FontWeight.w700,
        ),
        if (subTitle!.isNotEmpty)
          MyText(
            textAlign: TextAlign.center,
            text: subTitle ?? '',
            size: 14,
            paddingBottom: 40,
            fontFamily: AppFonts.GIL_SANS,
            color: kTertiaryColor.withOpacity(0.7),
            weight: FontWeight.w500,
          ),
      ],
    );
  }
}
