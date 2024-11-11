import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class WriteReview extends StatelessWidget {
  const WriteReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Write Review',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.DEFAULT,
              physics: BouncingScrollPhysics(),
              children: [
                _buildCourseInformation(),
                MyText(
                  paddingTop: 10,
                  text: 'Your over all rating for this course',
                  size: 14,
                  color: kDarkGreyColor.withOpacity(0.7),
                  weight: FontWeight.w500,
                  paddingBottom: 16,
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: RatingBar.builder(
                    glow: false,
                    initialRating: 3,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        Assets.imagesStar,
                        height: 32,
                        color: kSecondaryColor,
                      );
                    },
                    unratedColor: kQuaternaryColor,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 10),
                    itemSize: 32.0,
                    onRatingUpdate: (double value) {},
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kPrimaryColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        color: kGreyColor.withOpacity(0.15),
                      ),
                    ],
                  ),
                  child: MyTextField(
                    labelText: 'Add detailed review',
                    hintText: 'Type here...',
                    maxLines: 5,
                    marginBottom: 0.0,
                  ),
                ),
                MyText(
                  paddingTop: 26,
                  text: 'How was your experience with John?',
                  size: 14,
                  color: kDarkGreyColor.withOpacity(0.7),
                  weight: FontWeight.w500,
                  paddingBottom: 16,
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: RatingBar.builder(
                    glow: false,
                    initialRating: 3,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        Assets.imagesStar,
                        height: 32,
                        color: kSecondaryColor,
                      );
                    },
                    unratedColor: kQuaternaryColor,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 10),
                    itemSize: 32.0,
                    onRatingUpdate: (double value) {},
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kPrimaryColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        color: kGreyColor.withOpacity(0.15),
                      ),
                    ],
                  ),
                  child: MyTextField(
                    labelText: 'Add detailed review',
                    hintText: 'Type here...',
                    maxLines: 5,
                    marginBottom: 0.0,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Submit',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCourseInformation() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: Get.width,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            color: kTertiaryColor.withOpacity(0.16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CommonImageView(
                height: 42,
                width: 42,
                radius: 100.0,
                url: dummyImages[0],
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'John Doe',
                      size: 14,
                      weight: FontWeight.w700,
                    ),
                    MyText(
                      text: 'Design Expert',
                      size: 12,
                      color: kDarkGreyColor,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kDarkGreyColor.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.imagesCallMentor,
                      height: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kDarkGreyColor.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.imagesChatA,
                      height: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          MyText(
            paddingLeft: 2,
            text: 'Design Thinking Fundamentals',
            size: 18,
            weight: FontWeight.w800,
            paddingBottom: 6,
          ),
          Wrap(
            spacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesPlay,
                    color: kTertiaryColor.withOpacity(0.5),
                    height: 13,
                  ),
                  MyText(
                    paddingLeft: 8,
                    size: 12,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.AVENIR,
                    color: kTertiaryColor.withOpacity(0.7),
                    text: '32 Lessons',
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesCertificate,
                    color: kTertiaryColor.withOpacity(0.5),
                    height: 16,
                  ),
                  MyText(
                    paddingLeft: 8,
                    size: 12,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.AVENIR,
                    color: kTertiaryColor.withOpacity(0.7),
                    text: 'Certificate',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 30,
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
                    text: 'Best Seller',
                  ),
                ),
              ),
              Spacer(),
              Image.asset(
                Assets.imagesStar,
                height: 16,
                color: kSecondaryColor,
              ),
              MyText(
                paddingTop: 2.5,
                paddingLeft: 5,
                text: '4.8 ',
                fontFamily: AppFonts.AVENIR,
                weight: FontWeight.w600,
                size: 14,
              ),
              MyText(
                paddingTop: 2.5,
                text: '(365 reviews)',
                color: kOfflineColor,
                size: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
