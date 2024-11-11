import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/home/home/course_details.dart';
import 'package:e_learning_app/view/widget/course_wigdet.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Popular Courses',
      ),
      body: ListView.builder(
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
    );
  }
}
