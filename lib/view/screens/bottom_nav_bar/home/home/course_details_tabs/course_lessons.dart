import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CourseLessons extends StatelessWidget {
  const CourseLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        Row(
          children: [
            MyText(
              text: 'Lessons ',
              size: 16,
              weight: FontWeight.w600,
            ),
            MyText(
              text: '(45)',
              size: 16,
              color: kSecondaryColor,
              weight: FontWeight.w600,
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, _titleIndex) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text:
                            'Section ${_titleIndex + 1} - ${_titleIndex == 0 ? 'Introduction' : 'Fundamentals'}'
                            '',
                        size: 14,
                        weight: FontWeight.w500,
                        color: kTertiaryColor.withOpacity(0.7),
                      ),
                    ),
                    MyText(
                      text: '15 Min',
                      size: 14,
                      color: kSecondaryColor,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  itemCount: _titleIndex == 0 ? 2 : 15,
                  itemBuilder: (context, _lessonIndex) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1.0,
                          color: kTertiaryColor.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kSecondaryColor.withOpacity(0.2),
                            ),
                            child: Center(
                              child: MyText(
                                text: '${_lessonIndex + 1}',
                                size: 14,
                                color: kSecondaryColor,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: 'Introduction to Design Thinking',
                                  size: 13,
                                  weight: FontWeight.w600,
                                ),
                                MyText(
                                  text: '05:00',
                                  size: 12,
                                  color: kTertiaryColor.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            _titleIndex == 0
                                ? Assets.imagesPlay
                                : Assets.imagesPassword,
                            height: 24,
                            color: _titleIndex == 0
                                ? kSecondaryColor
                                : kTertiaryColor.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    );
                  },
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
