import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/course/course.dart';
import 'package:e_learning_app/view/screens/write_review/write_review.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/continue_learning_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = [
      'Ongoing',
      'Completed',
    ];

    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          shadowColor: kTertiaryColor.withOpacity(0.16),
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: MyText(
            text: 'My Courses',
            size: 22,
            weight: FontWeight.w700,
            fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
          ),
          bottom: PreferredSize(
            preferredSize: Size(0, 40),
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
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            _Ongoing(),
            _Completed(),
          ],
        ),
      ),
    );
  }
}

class _Ongoing extends StatelessWidget {
  const _Ongoing({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}

class _Completed extends StatelessWidget {
  const _Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(20, 36, 20, 16),
      physics: BouncingScrollPhysics(),
      itemCount: dummyImages.length,
      itemBuilder: (context, index) {
        return _CompletedCourses(
          image: dummyImages[index],
          courseType: index.isEven ? 'Coding' : 'Marketing',
          courseName: index.isEven ? 'Java Advance' : 'SEO Strategies',
          mentorName: 'Robert Green',
          currentProgress: 1.0,
          coveredLectures: '25',
          totalLectures: '25',
          onTap: () => Get.to(() => Course()),
        );
      },
    );
  }
}

class _CompletedCourses extends StatelessWidget {
  const _CompletedCourses({
    super.key,
    required this.image,
    required this.courseType,
    required this.courseName,
    required this.mentorName,
    required this.currentProgress,
    required this.onTap,
    required this.coveredLectures,
    required this.totalLectures,
    this.showReviewButton = false,
  });
  final String image;
  final String courseType;
  final String courseName;
  final String mentorName;
  final double currentProgress;
  final VoidCallback onTap;
  final String coveredLectures;
  final String totalLectures;
  final bool? showReviewButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: kTertiaryColor.withOpacity(0.1),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonImageView(
                radius: 10,
                width: 120,
                url: image,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 25,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: kGreenColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: MyText(
                              size: 12,
                              weight: FontWeight.w500,
                              text: courseType,
                              color: kGreenColor,
                            ),
                          ),
                        ),
                        MyText(
                          onTap: () => Get.to(() => WriteReview()),
                          text: 'Review'.toUpperCase(),
                          size: 12,
                          weight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 4,
                      text: courseName,
                      size: 13,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontFamily: AppFonts.AVENIR,
                      weight: FontWeight.w600,
                      paddingBottom: 4,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesUser,
                          color: kTertiaryColor.withOpacity(0.5),
                          height: 16,
                        ),
                        Expanded(
                          child: MyText(
                            paddingLeft: 8,
                            size: 12,
                            weight: FontWeight.w500,
                            fontFamily: AppFonts.AVENIR,
                            color: kTertiaryColor.withOpacity(0.7),
                            text: mentorName,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        MyText(
                          text: 'Total Lessons: ',
                          size: 12,
                          fontFamily: AppFonts.AVENIR,
                          color: kTertiaryColor.withOpacity(0.7),
                        ),
                        MyText(
                          text: '$coveredLectures/$totalLectures',
                          size: 10,
                          weight: FontWeight.w500,
                          fontFamily: AppFonts.AVENIR,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          onTap: () => Get.to(() => Course()),
                          size: 12,
                          decoration: TextDecoration.underline,
                          weight: FontWeight.w600,
                          text: 'View Certificate'.toUpperCase(),
                          color: kGreenColor,
                        ),
                        Image.asset(
                          Assets.imagesCompletedCheck,
                          height: 28,
                        ),
                      ],
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
}
