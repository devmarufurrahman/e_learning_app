import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: kTertiaryColor.withOpacity(0.05),
        highlightColor: kTertiaryColor.withOpacity(0.05),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    height: 24,
                  ),
                  Expanded(
                    child: MyText(
                      paddingLeft: 10,
                      text: title,
                      size: 16,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Image.asset(
                    Assets.imagesArrowNext,
                    height: 16,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 0.5,
              color: kDarkGreyColor.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
