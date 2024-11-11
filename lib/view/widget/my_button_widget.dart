import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.radius,
    this.textSize,
    this.fontWeight,
    this.icon = '',
    this.bgColor = kSecondaryColor,
    this.textColor,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize, radius;

  FontWeight? fontWeight;
  String? icon;
  Color? bgColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            color: kSecondaryColor.withOpacity(0.28),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(radius ?? 50),
        color: kSecondaryColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor.withOpacity(0.1),
          highlightColor: kTertiaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(radius ?? 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon!.isNotEmpty)
                Image.asset(
                  icon!,
                  height: 20,
                  color: kPrimaryColor,
                ),
              MyText(
                paddingLeft: icon!.isNotEmpty ? 9.5 : 0,
                paddingRight: icon!.isNotEmpty ? 9.5 : 0,
                text: buttonText,
                size: textSize ?? 16,
                weight: fontWeight ?? FontWeight.w500,
                color: textColor ?? kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyBorderButton extends StatelessWidget {
  MyBorderButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.radius,
    this.bgColor = kSecondaryColor,
    this.textColor,
    this.icon = '',
    this.fontWeight,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize, radius;
  Color? bgColor, textColor;
  String? icon;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 50),
        color: Colors.transparent,
        border: Border.all(
          width: 0.8,
          color: bgColor ?? kSecondaryColor,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: bgColor!.withOpacity(0.1),
          highlightColor: bgColor!.withOpacity(0.1),
          borderRadius: BorderRadius.circular(radius ?? 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon!.isNotEmpty)
                Image.asset(
                  icon!,
                  height: 16,
                ),
              MyText(
                paddingLeft: icon!.isNotEmpty ? 11 : 0,
                text: buttonText,
                size: textSize ?? 16,
                weight: fontWeight ?? FontWeight.w500,
                color: textColor ?? kSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyToggleButton extends StatelessWidget {
  MyToggleButton({
    required this.buttonText,
    required this.onTap,
    required this.isSelected,
  });

  final String buttonText;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14,
      ),
      height: Get.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isSelected ? kSecondaryColor : Colors.transparent,
        border: Border.all(
          width: 0.8,
          color: kSecondaryColor,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor.withOpacity(0.1),
          highlightColor: kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
          child: Center(
            child: MyText(
              text: buttonText,
              size: 14,
              lineHeight: null,
              weight: FontWeight.w500,
              color: isSelected ? kPrimaryColor : kSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
