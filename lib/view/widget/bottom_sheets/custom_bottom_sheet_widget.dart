import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.height,
    required this.title,
    required this.child,
    this.paddingHorizontal,
    this.marginBottom,
  });
  final double height;
  final String title;
  final Widget child;
  final double? paddingHorizontal;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              width: 30,
              height: 8,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          MyText(
            textAlign: TextAlign.center,
            text: title,
            size: 22,
            fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
            weight: FontWeight.w700,
            paddingBottom: 6,
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 20),
              child: child,
            ),
          ),
          SizedBox(
            height: marginBottom ?? 16,
          ),
        ],
      ),
    );
  }
}
