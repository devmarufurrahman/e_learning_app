import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    super.key,
    required this.image,
    required this.courseName,
    required this.mentorName,
    required this.totalRating,
    required this.totalReviews,
    required this.price,
    required this.isBookmarked,
    required this.isBestSeller,
    required this.onTap,
    this.onBookmark,
    this.haveBookmarkIcon = true,
  });
  final String image;
  final String courseName;
  final String mentorName;
  final String totalRating;
  final String totalReviews;
  final String price;
  final bool isBookmarked;
  final bool isBestSeller;
  final VoidCallback onTap;
  final VoidCallback? onBookmark;
  final bool? haveBookmarkIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 250,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  CommonImageView(
                    radius: 10,
                    width: Get.width,
                    url: image,
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    left: 8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isBestSeller)
                          Container(
                            height: 25,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: MyText(
                                size: 12,
                                weight: FontWeight.w500,
                                fontFamily: AppFonts.AVENIR,
                                color: kSecondaryColor,
                                text: 'Best Seller',
                              ),
                            ),
                          )
                        else
                          SizedBox(),
                        if (haveBookmarkIcon!)
                          GestureDetector(
                            onTap: onBookmark,
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10,
                                    color: kTertiaryColor.withOpacity(0.1),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  isBookmarked
                                      ? Assets.imagesSavedFilled
                                      : Assets.imagesSaveEmpty,
                                  height: 16,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 8,
              text: courseName,
              size: 14,
              fontFamily: AppFonts.AVENIR,
              weight: FontWeight.w600,
              paddingBottom: 4,
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
            SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesStar,
                  height: 13,
                  color: kSecondaryColor,
                ),
                MyText(
                  paddingTop: 2.5,
                  paddingLeft: 4,
                  text: '$totalRating ',
                  fontFamily: AppFonts.AVENIR,
                  weight: FontWeight.w600,
                  size: 12,
                ),
                MyText(
                  paddingTop: 2.5,
                  text: '($totalReviews reviews)',
                  color: kDarkGreyColor.withOpacity(0.7),
                  size: 11,
                ),
                Expanded(
                  child: MyText(
                    textAlign: TextAlign.end,
                    paddingRight: 5,
                    size: 14,
                    color: kSecondaryColor,
                    weight: FontWeight.w900,
                    fontFamily: AppFonts.AVENIR,
                    text: '\$$price',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
