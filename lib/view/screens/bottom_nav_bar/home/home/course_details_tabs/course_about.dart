import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/chat_screen.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/video_call.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class CourseAbout extends StatelessWidget {
  const CourseAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          text: 'About Course',
          size: 16,
          weight: FontWeight.w600,
          paddingBottom: 10,
        ),
        ReadMoreText(
          'My wife & I have moved 6 times in the last 25 years. Obviously, we\'ve dealt with many realtors both on the buying and selling side. I have to say that David is by far the BEST realtor we\'ve ever worked with, his professionalism, personality, attention to detail, responsiveness and',
          trimLines: 2,
          colorClickableText: kSecondaryColor,
          trimMode: TrimMode.Length,
          trimCollapsedText: ' Read more',
          trimExpandedText: ' Read less',
          style: TextStyle(
            fontSize: 13,
            color: kDarkGreyColor,
            fontFamily: AppFonts.AVENIR,
            height: 1.4,
          ),
          moreStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: kSecondaryColor,
            fontFamily: AppFonts.AVENIR,
          ),
          lessStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: kSecondaryColor,
            fontFamily: AppFonts.AVENIR,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MyText(
          text: 'Tutor',
          size: 16,
          weight: FontWeight.w600,
          paddingBottom: 6,
        ),
        Row(
          children: [
            CommonImageView(
              height: 50,
              width: 50,
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
                    size: 17,
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
              onTap: () {
                Get.to(() => VideoCall());
              },
              child: Container(
                height: 40,
                width: 40,
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
              onTap: () {
                Get.to(() => ChatScreen());
              },
              child: Container(
                height: 40,
                width: 40,
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
        MyText(
          paddingTop: 20,
          text: 'Info',
          size: 16,
          weight: FontWeight.w600,
          paddingBottom: 10,
        ),
        Row(
          children: [
            Expanded(
              child: _InfoColumn(
                title: 'Students',
                subTitle: '156,261',
              ),
            ),
            Expanded(
              child: _InfoColumn(
                title: 'Language',
                subTitle: 'English',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: _InfoColumn(
                title: 'Last update',
                subTitle: 'Feb 2, 2023',
              ),
            ),
            Expanded(
              child: _InfoColumn(
                title: 'Subtitle',
                subTitle: 'English, and 5 more',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: _InfoColumn(
                title: 'Level',
                subTitle: 'Beginner',
              ),
            ),
            Expanded(
              child: _InfoColumn(
                title: 'Access',
                subTitle: 'Mobile, Desktop',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

class _InfoColumn extends StatelessWidget {
  const _InfoColumn({
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: title,
          size: 14,
          paddingBottom: 4,
          color: kDarkGreyColor,
        ),
        MyText(
          text: subTitle,
          size: 16,
          weight: FontWeight.w600,
        ),
      ],
    );
  }
}
