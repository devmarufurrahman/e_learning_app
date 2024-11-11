import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpAndSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Help Center'),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: AppSizes.DEFAULT,
        shrinkWrap: true,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 10,
                  color: kTertiaryColor.withOpacity(0.1),
                ),
              ],
            ),
            child: MyTextField(
              hintText: 'Search',
              filledColor: kPrimaryColor,
              prefix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesSearchNew,
                    height: 20,
                  ),
                ],
              ),
              marginBottom: 0.0,
            ),
          ),
          MyText(
            paddingTop: 30,
            text: 'Frequently Asked Questions',
            size: 20,
            paddingBottom: 10,
            weight: FontWeight.w600,
          ),
          _FAQCard(
            title: 'Can i access my course offline?',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. ',
          ),
          _FAQCard(
            title: 'How do i enroll in a course',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. ',
          ),
          _FAQCard(
            title: 'Is there a way to track my progress?',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. ',
          ),
          _FAQCard(
            title: 'How do i reach out help and support?',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. ',
          ),
          _FAQCard(
            title: 'Is my data safe and secure?',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. ',
          ),
          _FAQCard(
            title: 'Do you offer a certificate?',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. ',
          ),
          _FAQCard(
            title: 'Are there any subscriptions?',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. ',
          ),
        ],
      ),
    );
  }
}

class _FAQCard extends StatelessWidget {
  const _FAQCard({
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimaryColor,
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
          MyText(
            text: title,
            size: 16,
            weight: FontWeight.bold,
            paddingBottom: 8,
          ),
          MyText(
            text: subTitle,
            size: 13,
            weight: FontWeight.w500,
            color: kDarkGreyColor,
          ),
        ],
      ),
    );
  }
}
