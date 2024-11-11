import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/chat_screen.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/video_call.dart';
import 'package:e_learning_app/view/screens/mentor_details/mentor_about.dart';
import 'package:e_learning_app/view/screens/mentor_details/mentor_courses.dart';
import 'package:e_learning_app/view/screens/mentor_details/mentor_reviews.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorDetails extends StatelessWidget {
  MentorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = [
      'About',
      'Courses',
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
                centerTitle: true,
                leadingWidth: 70,
                pinned: true,
                floating: false,
                backgroundColor: kPrimaryColor,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: kBorderColor,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            Assets.imagesArrowBack,
                            height: 14,
                            color: kTertiaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                title: MyText(
                  text: 'Mentor Details',
                  size: 22,
                  weight: FontWeight.w700,
                  fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
                ),
                automaticallyImplyLeading: false,
                expandedHeight: 200,
                elevation: 1,
                forceElevated: true,
                shadowColor: kTertiaryColor.withOpacity(0.16),
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
                  background: _buildCourseInformation(),
                ),
                actions: [
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: kBorderColor,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            Assets.imagesShare,
                            height: 24,
                            color: kTertiaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ];
          },
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              MentorAbout(),
              MentorCourses(),
              MentorReviews(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseInformation() {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 90,
        ),
        GestureDetector(
          onTap: () => Get.to(() => MentorDetails()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonImageView(
                height: 65,
                width: 65,
                radius: 100.0,
                url: dummyImages[0],
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'John Doe',
                      size: 18,
                      paddingLeft: 1.5,
                      weight: FontWeight.w800,
                    ),
                    MyText(
                      paddingLeft: 1.5,
                      text: 'Design Expert',
                      size: 13,
                      color: kDarkGreyColor,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesStar,
                          height: 14,
                          color: kSecondaryColor,
                        ),
                        MyText(
                          paddingTop: 2.5,
                          paddingLeft: 5,
                          text: '4.8 ',
                          fontFamily: AppFonts.AVENIR,
                          weight: FontWeight.w600,
                          size: 12,
                        ),
                        MyText(
                          paddingTop: 2.5,
                          text: '(365 reviews)',
                          color: kOfflineColor,
                          size: 12,
                        ),
                      ],
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
      ],
    );
  }
}
