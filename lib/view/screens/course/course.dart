import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Course extends StatelessWidget {
  const Course({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = [
      'Lessons',
      'Certificate',
    ];

    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          toolbarHeight: 70,
          shadowColor: kTertiaryColor.withOpacity(0.16),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          leadingWidth: 70,
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
              )
            ],
          ),
          title: MyText(
            text: 'Course',
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
            _Lessons(),
            _Certificate(),
          ],
        ),
      ),
    );
  }
}

class _Lessons extends StatelessWidget {
  const _Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, _titleIndex) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text:
                              'Section ${_titleIndex + 1} - ${_titleIndex == 0 ? 'Introduction' : 'Fundamentals'}'
                              '',
                          size: 14,
                          weight: FontWeight.w500,
                          color: kTertiaryColor.withOpacity(0.7),
                        ),
                      ),
                      MyText(
                        text: '15 Min',
                        size: 14,
                        color: kSecondaryColor,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    itemCount: _titleIndex == 0 ? 2 : 15,
                    itemBuilder: (context, _lessonIndex) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1.0,
                            color: kTertiaryColor.withOpacity(0.1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kSecondaryColor.withOpacity(0.2),
                              ),
                              child: Center(
                                child: MyText(
                                  text: '${_lessonIndex + 1}',
                                  size: 14,
                                  color: kSecondaryColor,
                                  weight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: 'Introduction to Design Thinking',
                                    size: 13,
                                    weight: FontWeight.w600,
                                  ),
                                  MyText(
                                    text: '05:00',
                                    size: 12,
                                    color: kTertiaryColor.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              Assets.imagesPlay,
                              height: 24,
                              color: kSecondaryColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Start Course Again',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _Certificate extends StatelessWidget {
  const _Certificate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            margin: AppSizes.DEFAULT,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  color: kTertiaryColor.withOpacity(0.16),
                ),
              ],
            ),
            child: CommonImageView(
              height: Get.height,
              width: Get.width,
              radius: 12.0,
              imagePath: Assets.imagesDummyCertificate,
            ),
          ),
        ),
        Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Download Certificate',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
