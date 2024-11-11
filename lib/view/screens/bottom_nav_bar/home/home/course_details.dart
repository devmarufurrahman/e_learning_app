import 'dart:ui';

import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/enroll_now/enroll_now.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/home/home/course_details_tabs/course_about.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/home/home/course_details_tabs/course_lessons.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/home/home/course_details_tabs/course_reviews.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = [
      'About',
      'Lessons',
      'Reviews',
    ];
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 0,
      child: Scaffold(
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: 450,
                elevation: 0,
                shape: Border(
                  bottom: BorderSide(
                    width: 0.8,
                    color: kTertiaryColor.withOpacity(0.1),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size(0, 55),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    width: Get.width,
                    child: TabBar(
                      indicatorColor: kSecondaryColor,
                      indicatorWeight: 3,
                      indicatorPadding: AppSizes.HORIZONTAL,
                      automaticIndicatorColorAdjustment: false,
                      labelColor: kSecondaryColor,
                      unselectedLabelColor: kDarkGreyColor.withOpacity(0.5),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.AVENIR,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.AVENIR,
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: _tabs.map(
                        (e) {
                          return Tab(
                            child: Text(e),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _buildCourseThumbnail(),
                      _buildAppBarControls(),
                      _buildCourseInformation(),
                      _buildCoursePreview(),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  CourseAbout(),
                  CourseLessons(),
                  CourseReviews(),
                ],
              ),
              Container(
                height: 70,
                padding: AppSizes.HORIZONTAL,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -4),
                      blurRadius: 30,
                      spreadRadius: -2,
                      color: kTertiaryColor.withOpacity(0.10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: 'Total Price',
                            size: 14,
                            weight: FontWeight.w500,
                            color: kTertiaryColor.withOpacity(0.5),
                          ),
                          MyText(
                            size: 18,
                            color: kSecondaryColor,
                            weight: FontWeight.w900,
                            fontFamily: AppFonts.AVENIR,
                            text: '\$180.00',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: MyButton(
                        buttonText: 'Enroll Now',
                        onTap: () {
                          Get.to(() => EnrollNow());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCourseInformation() {
    return Container(
      padding: AppSizes.DEFAULT,
      height: 190,
      width: Get.width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: MyText(
                    size: 14,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.AVENIR,
                    color: kSecondaryColor,
                    text: 'Best Seller',
                  ),
                ),
              ),
              Spacer(),
              Image.asset(
                Assets.imagesStar,
                height: 18,
                color: kSecondaryColor,
              ),
              MyText(
                paddingTop: 2.5,
                paddingLeft: 5,
                text: '4.8 ',
                fontFamily: AppFonts.AVENIR,
                weight: FontWeight.w600,
                size: 16,
              ),
              MyText(
                paddingTop: 2.5,
                text: '(365 reviews)',
                color: kOfflineColor,
                size: 14,
              ),
            ],
          ),
          MyText(
            paddingLeft: 2,
            paddingTop: 10,
            text: 'Design Thinking Fundamentals',
            size: 21.2,
            weight: FontWeight.w800,
            paddingBottom: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesUser,
                    color: kTertiaryColor.withOpacity(0.5),
                    height: 16,
                  ),
                  MyText(
                    paddingLeft: 8,
                    size: 12,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.AVENIR,
                    color: kTertiaryColor.withOpacity(0.7),
                    text: 'Robert Green',
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesPlay,
                    color: kTertiaryColor.withOpacity(0.5),
                    height: 13,
                  ),
                  MyText(
                    paddingLeft: 8,
                    size: 12,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.AVENIR,
                    color: kTertiaryColor.withOpacity(0.7),
                    text: '32 Lessons',
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesCertificate,
                    color: kTertiaryColor.withOpacity(0.5),
                    height: 16,
                  ),
                  MyText(
                    paddingLeft: 8,
                    size: 12,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.AVENIR,
                    color: kTertiaryColor.withOpacity(0.7),
                    text: 'Certificate',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Positioned _buildAppBarControls() {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
              child: Center(
                child: Image.asset(
                  Assets.imagesArrowBackYellow,
                  height: 20,
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Center(
              child: Image.asset(
                Assets.imagesShare,
                height: 20,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Center(
              child: Image.asset(
                Assets.imagesSavedFilled,
                height: 16,
                color: kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  CommonImageView _buildCourseThumbnail() {
    return CommonImageView(
      height: Get.height,
      width: Get.width,
      radius: 0.0,
      url: dummyImages[0],
    );
  }

  Center _buildCoursePreview() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 150),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 48,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kPrimaryColor.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    Assets.imagesPlay,
                    height: 28,
                    color: kPrimaryColor,
                  ),
                  MyText(
                    paddingRight: 5,
                    text: 'Course Preview',
                    size: 16,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
