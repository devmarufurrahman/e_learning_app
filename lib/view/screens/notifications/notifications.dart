import 'dart:async';

import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/write_review/write_review.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/custom_drop_down.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../constants/app_fonts.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Notifications',
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          final List<Map<String, dynamic>> _dummyNotifications = [
            {
              'type': 'Today',
              'notifications': [
                {
                  'title': 'Course Review Request',
                  'avatarUrl': dummyImg,
                  'notificationText':
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  'time': 'Just now',
                  'isNew': true,
                  'haveReviewButton': true,
                },
              ],
            },
            {
              'type': 'Yesterday',
              'notifications': [
                {
                  'title': 'New Course Arrival',
                  'avatarUrl': dummyImg,
                  'notificationText':
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  'time': 'Yesterday',
                  'isNew': false,
                  'haveReviewButton': false,
                },
                {
                  'title': 'Certificate Available',
                  'avatarUrl': dummyImg,
                  'notificationText':
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  'time': 'Yesterday',
                  'isNew': false,
                  'haveReviewButton': false,
                },
                {
                  'title': 'Lesson 3 Unlocked',
                  'avatarUrl': dummyImg,
                  'notificationText':
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  'time': 'Yesterday',
                  'isNew': false,
                  'haveReviewButton': false,
                },
              ],
            },
          ];

          final _data = _dummyNotifications[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                paddingLeft: 20,
                paddingTop: 10,
                paddingBottom: 10,
                text: _data['type'].toUpperCase(),
                size: 14,
                color: kDarkGreyColor.withOpacity(0.5),
                weight: FontWeight.w500,
              ),
              ...List.generate(
                _data['notifications'].length,
                (i) {
                  final _notificationData = _data['notifications'][i];
                  return _NotificationTiles(
                    title: _notificationData['title'],
                    avatarUrl: index.isEven ? dummyImages[3] : dummyImages[0],
                    notificationText: _notificationData['notificationText'],
                    time: _notificationData['time'],
                    isNewNotification: _notificationData['isNew'],
                    haveReviewButton: _notificationData['haveReviewButton'],
                    onTap: () {},
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class _NotificationTiles extends StatelessWidget {
  _NotificationTiles({
    Key? key,
    required this.notificationText,
    required this.time,
    this.isNewNotification = false,
    this.haveReviewButton = false,
    required this.avatarUrl,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final String avatarUrl, notificationText, time, title;
  bool? isNewNotification, haveReviewButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: AppSizes.HORIZONTAL,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonImageView(
                height: 45.64,
                width: 45.64,
                url: avatarUrl,
                radius: 100.0,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: title,
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                    MyText(
                      text: notificationText,
                      size: 12,
                      color: kDarkGreyColor.withOpacity(0.7),
                    ),
                    if (haveReviewButton!)
                      Row(
                        children: [
                          Container(
                            width: 104,
                            margin: EdgeInsets.only(top: 8),
                            child: MyButton(
                              height: 30,
                              textSize: 12,
                              radius: 5,
                              fontWeight: FontWeight.w500,
                              buttonText: 'Leave a Review',
                              onTap: () {
                                Get.to(() => WriteReview());
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    paddingLeft: 10,
                    paddingBottom: 17,
                    text: time,
                    size: 12,
                    color: Color(0xffADB3BC),
                    letterSpacing: 0.4,
                  ),
                  if (isNewNotification!)
                    Container(
                      height: 7.61,
                      width: 7.61,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: kTertiaryColor.withOpacity(0.1),
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
        ),
      ],
    );
  }
}
