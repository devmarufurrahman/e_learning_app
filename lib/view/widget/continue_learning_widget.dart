import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ContinueLearningWidget extends StatelessWidget {
  const ContinueLearningWidget({
    super.key,
    required this.image,
    required this.courseType,
    required this.courseName,
    required this.mentorName,
    required this.currentProgress,
    required this.onTap,
    required this.coveredLectures,
    required this.totalLectures,
  });
  final String image;
  final String courseType;
  final String courseName;
  final String mentorName;
  final double currentProgress;
  final VoidCallback onTap;
  final String coveredLectures;
  final String totalLectures;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: kTertiaryColor.withOpacity(0.1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonImageView(
              radius: 10,
              height: Get.height,
              width: 100,
              url: image,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 25,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: MyText(
                            size: 12,
                            weight: FontWeight.w500,
                            fontFamily: AppFonts.AVENIR,
                            color: kSecondaryColor,
                            text: courseType,
                          ),
                        ),
                      ),
                    ],
                  ),
                  MyText(
                    text: courseName,
                    size: 14,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontFamily: AppFonts.AVENIR,
                    weight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Assets.imagesUser,
                        color: kTertiaryColor.withOpacity(0.5),
                        height: 16,
                      ),
                      Expanded(
                        child: MyText(
                          paddingLeft: 8,
                          size: 12,
                          weight: FontWeight.w500,
                          fontFamily: AppFonts.AVENIR,
                          color: kTertiaryColor.withOpacity(0.7),
                          text: mentorName,
                        ),
                      ),
                    ],
                  ),
                  LinearPercentIndicator(
                    lineHeight: 6.0,
                    barRadius: Radius.circular(50),
                    percent: currentProgress,
                    animationDuration: 2000,
                    animation: true,
                    padding: EdgeInsets.zero,
                    backgroundColor: kTertiaryColor.withOpacity(0.08),
                    progressColor:
                        currentProgress == 1.0 ? kGreenColor : kSecondaryColor,
                    trailing: MyText(
                      paddingLeft: 10,
                      text: '$coveredLectures/$totalLectures',
                      size: 10,
                      color: kDarkGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
