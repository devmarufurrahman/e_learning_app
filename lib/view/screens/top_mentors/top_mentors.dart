import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/chat_screen.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/video_call.dart';
import 'package:e_learning_app/view/screens/mentor_details/mentor_details.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopMentors extends StatelessWidget {
  const TopMentors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Top Mentors',
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: AppSizes.HORIZONTAL,
        physics: BouncingScrollPhysics(),
        itemCount: dummyImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 14),
            child: GestureDetector(
              onTap: () => Get.to(() => MentorDetails()),
              child: Row(
                children: [
                  CommonImageView(
                    height: 50,
                    width: 50,
                    radius: 100.0,
                    url: dummyImages[index],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: index.isEven ? 'John Doe' : 'Jenny M.',
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
            ),
          );
        },
      ),
    );
  }
}
