
import 'dart:ui';

import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kDarkGreyColor.withOpacity(0.07),
            ),
            child: Center(
              child: Image.asset(
                icon,
                height: 32,
              ),
            ),
          ),
        ),
        MyText(
          text: title,
          size: 13,
          weight: FontWeight.w600,
        ),
      ],
    );
  }
}
