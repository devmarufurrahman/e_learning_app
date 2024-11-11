import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:e_learning_app/view/screens/enroll_now/payment_successful.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/payment_methods/payment_methods.dart';
import 'package:e_learning_app/view/widget/congratulation_widget.dart';
import 'package:e_learning_app/view/widget/course_wigdet.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnrollNow extends StatelessWidget {
  const EnrollNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Review Summary',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.HORIZONTAL,
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 230,
                  child: CourseWidget(
                    image: dummyImages[0],
                    courseName: 'Design Thinking Fundamentals',
                    mentorName: 'Robert Green',
                    totalRating: '4.8',
                    totalReviews: '1.5k',
                    price: '180.00',
                    isBookmarked: true,
                    isBestSeller: true,
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6, bottom: 16),
                  height: 1,
                  color: kTertiaryColor.withOpacity(0.1),
                ),
                _InfoRow(
                  title: 'Language',
                  subTitle: 'English',
                ),
                _InfoRow(
                  title: 'Lessons',
                  subTitle: '32',
                ),
                _InfoRow(
                  title: 'Level',
                  subTitle: 'Beginner',
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 16),
                  height: 1,
                  color: kTertiaryColor.withOpacity(0.1),
                ),
                _InfoRow(
                  title: 'Amount',
                  subTitle: '\$180.00',
                ),
                _InfoRow(
                  title: 'Tax',
                  subTitle: '\$5.00',
                ),
                SizedBox(
                  height: 20,
                ),
                _InfoRow(
                  title: 'Total',
                  subTitle: '\$185.00',
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 16),
                  height: 1,
                  color: kTertiaryColor.withOpacity(0.1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.imagesPaymentMethod,
                      height: 24,
                    ),
                    Expanded(
                      child: MyText(
                        paddingLeft: 10,
                        text: 'Apple Pay',
                        size: 16,
                        weight: FontWeight.w600,
                      ),
                    ),
                    MyText(
                      onTap: () => Get.to(() => PaymentMethods()),
                      text: 'Change',
                      size: 14,
                      decoration: TextDecoration.underline,
                      color: kSecondaryColor,
                      weight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Done',
              onTap: () => Get.to(
                () => PaymentSuccessful(
                  congratsMsg:
                      'You have successfully made\npayment and enrolled the course.',
                  onContinue: () {
                    Get.offAll(() => BottomNavBar());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            text: title,
            size: 14,
            weight: FontWeight.w500,
            color: kDarkGreyColor,
          ),
          MyText(
            text: subTitle,
            size: 14,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
