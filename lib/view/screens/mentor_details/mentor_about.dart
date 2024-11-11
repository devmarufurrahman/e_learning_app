import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MentorAbout extends StatelessWidget {
  const MentorAbout({super.key});

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
                title: 'Courses',
                subTitle: '32',
              ),
            ),
          ],
        ),
        MyText(
          paddingTop: 20,
          text: 'Experience',
          size: 16,
          weight: FontWeight.w600,
          paddingBottom: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    CommonImageView(
                      height: 42,
                      width: 42,
                      radius: 100.0,
                      url: index == 0 ? dummyImages[2] : dummyImages[0],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'Senior UI/UX Designer',
                            size: 17,
                            weight: FontWeight.w600,
                          ),
                          MyText(
                            text: '2020 - Now',
                            size: 14,
                            weight: FontWeight.w500,
                            color: kDarkGreyColor.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                ...List.generate(
                  4,
                  (expIndex) {
                    return MyText(
                      paddingBottom: 4,
                      text: '• Lorem ipsum dolor sit amet elit.',
                      size: 14,
                      weight: FontWeight.w500,
                      color: kDarkGreyColor.withOpacity(0.5),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  height: 1,
                  color: kTertiaryColor.withOpacity(0.1),
                ),
              ],
            );
          },
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
