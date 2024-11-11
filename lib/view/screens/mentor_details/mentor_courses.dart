import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/widget/course_wigdet.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottom_nav_bar/home/home/course_details.dart';

class MentorCourses extends StatelessWidget {
  const MentorCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSizes.VERTICAL,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          children: [
            MyText(
              paddingLeft: 20,
              text: 'Courses ',
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
          padding: AppSizes.HORIZONTAL,
          physics: BouncingScrollPhysics(),
          itemCount: dummyImages.length,
          itemBuilder: (context, index) {
            return Container(
              height: 230,
              child: CourseWidget(
                image: dummyImages[index],
                courseName: 'Design Thinking Fundamentals',
                mentorName: 'Robert Green',
                totalRating: '4.8',
                totalReviews: '1.5k',
                price: index.isEven ? '180.00' : '250.00',
                isBookmarked: index.isEven,
                isBestSeller: index.isEven,
                onTap: () {
                  Get.to(() => CourseDetails());
                },
              ),
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
