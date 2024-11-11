import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({
    super.key,
    required this.title,
    required this.onSeeAll,
    this.marginBottom,
  });
  final String title;
  final VoidCallback onSeeAll;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, marginBottom ?? 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: MyText(
              text: title,
              size: 18,
              weight: FontWeight.w600,
              fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
            ),
          ),
          MyText(
            onTap: onSeeAll,
            text: 'See all',
            size: 14,
            color: kSecondaryColor,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
