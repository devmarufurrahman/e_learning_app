import 'package:e_learning_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    Key? key,
    required this.isActive,
    required this.onTap,
    this.unSelectedColor,
  }) : super(key: key);

  final bool isActive;
  final VoidCallback onTap;
  final Color? unSelectedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 230,
        ),
        curve: Curves.easeInOut,
        height: 19,
        width: 19,
        decoration: BoxDecoration(
          color: isActive ? kSecondaryColor : kTertiaryColor.withOpacity(0.065),
          borderRadius: BorderRadius.circular(3.3),
        ),
        child: !isActive
            ? SizedBox()
            : Icon(
                Icons.check,
                size: 16,
                color: kPrimaryColor,
              ),
      ),
    );
  }
}
