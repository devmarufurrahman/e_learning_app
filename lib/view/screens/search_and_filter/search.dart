import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/chat_screen.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/video_call.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/home/home/course_details.dart';
import 'package:e_learning_app/view/screens/search_and_filter/filter.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/course_wigdet.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = [
      'Courses',
      'Mentors',
    ];
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: false,
                elevation: 3,
                leadingWidth: 70,
                shadowColor: kTertiaryColor.withOpacity(0.16),
                backgroundColor: kPrimaryColor,
                forceElevated: true,
                automaticallyImplyLeading: false,
                centerTitle: true,
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
                  text: 'Search',
                  size: 22,
                  weight: FontWeight.w700,
                  fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
                ),
                expandedHeight: 165,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: AppSizes.DEFAULT,
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
                          marginBottom: 0.0,
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
                          suffix: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: kSecondaryColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.bottomSheet(
                                        Filter(),
                                        isScrollControlled: true,
                                      );
                                    },
                                    child: Image.asset(
                                      Assets.imagesFilter,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size(0, 40),
                  child: Container(
                    width: Get.height,
                    height: 40,
                    color: kPrimaryColor,
                    child: TabBar(
                      indicatorColor: kSecondaryColor,
                      indicatorWeight: 2,
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
                          return Tab(child: Text(e));
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              _Courses(),
              _Mentors(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Courses extends StatelessWidget {
  const _Courses({super.key});

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
              text: 'Results for ',
              size: 16,
              weight: FontWeight.w600,
            ),
            Expanded(
              child: MyText(
                text: '"Design"',
                size: 16,
                weight: FontWeight.w600,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            MyText(
              text: '153 Results Found',
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

class _Mentors extends StatelessWidget {
  const _Mentors({super.key});

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
              text: 'Results for ',
              size: 16,
              weight: FontWeight.w600,
            ),
            Expanded(
              child: MyText(
                text: '"John"',
                size: 16,
                weight: FontWeight.w600,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            MyText(
              text: '7 Results Found',
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
          itemCount: dummyImages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 14),
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
