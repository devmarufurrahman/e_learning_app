import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/widget/continue_learning_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ContinueLearning extends StatelessWidget {
  const ContinueLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Continue Learning',
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: AppSizes.HORIZONTAL,
        physics: BouncingScrollPhysics(),
        itemCount: dummyImages.length,
        itemBuilder: (context, index) {
          return ContinueLearningWidget(
            image: dummyImages[index],
            courseType: 'Design',
            courseName: 'Introduction of Figma',
            mentorName: 'Robert Green',
            currentProgress: 0.7,
            coveredLectures: '21',
            totalLectures: '25',
            onTap: () {},
          );
        },
      ),
    );
  }
}
