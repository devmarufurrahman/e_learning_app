import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/utils/all_categories_list.dart';
import 'package:e_learning_app/view/screens/all_categories/all_categories.dart';
import 'package:e_learning_app/view/screens/continue_learning/continue_learning.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/home/home/course_details.dart';
import 'package:e_learning_app/view/screens/mentor_details/mentor_details.dart';
import 'package:e_learning_app/view/screens/notifications/notifications.dart';
import 'package:e_learning_app/view/screens/popular_courses/popular_courses.dart';
import 'package:e_learning_app/view/screens/search_and_filter/filter.dart';
import 'package:e_learning_app/view/screens/search_and_filter/search.dart';
import 'package:e_learning_app/view/screens/top_mentors/top_mentors.dart';
import 'package:e_learning_app/view/widget/actione_tile_widget.dart';
import 'package:e_learning_app/view/widget/category_widget.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/continue_learning_widget.dart';
import 'package:e_learning_app/view/widget/course_wigdet.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _buildAppBar(),
          ];
        },
        body: ListView(
          padding: AppSizes.VERTICAL,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            ActionTile(
              title: 'Categories',
              onSeeAll: () {
                Get.to(() => AllCategories());
              },
            ),
            _BuildCategories(),
            SizedBox(
              height: 30,
            ),
            ActionTile(
              title: 'Popular Course',
              marginBottom: 4,
              onSeeAll: () {
                Get.to(() => PopularCourses());
              },
            ),
            _BuildPopularCourses(),
            SizedBox(
              height: 30,
            ),
            ActionTile(
              title: 'Top Mentor',
              onSeeAll: () {
                Get.to(() => TopMentors());
              },
            ),
            _BuildTopMentors(),
            SizedBox(
              height: 30,
            ),
            ActionTile(
              title: 'Continue Learning',
              onSeeAll: () {
                Get.to(() => ContinueLearning());
              },
              marginBottom: 0.0,
            ),
            _ContinueLearning(),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      floating: true,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      elevation: 3,
      shadowColor: kTertiaryColor.withOpacity(0.16),
      titleSpacing: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(18),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: 'Hi, ALEX',
            size: 24,
            weight: FontWeight.bold,
            color: kPrimaryColor,
            fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
          ),
          MyText(
            text: 'Let\'s start learning!',
            size: 15,
            color: kPrimaryColor,
            weight: FontWeight.w500,
          ),
        ],
      ),
      expandedHeight: 155,
      backgroundColor: kSecondaryColor,
      actions: [
        Center(
          child: GestureDetector(
            onTap: () => Get.to(() => Notifications()),
            child: Container(
              margin: EdgeInsets.only(right: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kLightYellowColor,
              ),
              child: Center(
                child: Image.asset(
                  Assets.imagesNotification,
                  height: 22,
                ),
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: AppSizes.DEFAULT,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
            image: DecorationImage(
              image: AssetImage(
                Assets.imagesAppBarBg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  readOnly: true,
                  onTap: () => Get.to(() => Search()),
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
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        shrinkWrap: true,
        padding: AppSizes.HORIZONTAL,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          return CategoryWidget(
            icon: allCategories[index]['icon'],
            title: allCategories[index]['title'],
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14,
          );
        },
      ),
    );
  }
}

class _BuildPopularCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        shrinkWrap: true,
        padding: AppSizes.HORIZONTAL,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: dummyImages.length,
        itemBuilder: (context, index) {
          return CourseWidget(
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
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14,
          );
        },
      ),
    );
  }
}

class _BuildTopMentors extends StatelessWidget {
  const _BuildTopMentors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        shrinkWrap: true,
        padding: AppSizes.HORIZONTAL,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: dummyImages.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.to(() => MentorDetails()),
                child: CommonImageView(
                  height: 65,
                  width: 65,
                  radius: 100.0,
                  url: dummyImages[index],
                ),
              ),
              MyText(
                text: index.isEven ? 'John Doe' : 'Jenny M.',
                size: 13,
                weight: FontWeight.w600,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14,
          );
        },
      ),
    );
  }
}

class _ContinueLearning extends StatelessWidget {
  const _ContinueLearning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 14,
        );
      },
    );
  }
}
