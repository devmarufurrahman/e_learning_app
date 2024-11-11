import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/auth/login.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;

  void _onPageChanged() {
    setState(() {
      if (_currentIndex == 2) {
        Get.offAll(() => Login());
      } else {
        _currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _onBoardingContent = [
      {
        'title': 'Online Study is the',
        'subTitle': 'Best choice for ',
        'targetedText': 'everyone.',
        'image': Assets.imagesOn1,
      },
      {
        'title': 'Best platform for both',
        'subTitle': '',
        'targetedText': 'Teachers & Learners',
        'image': Assets.imagesOn2,
      },
      {
        'title': 'Learn Anytime,',
        'subTitle': 'Anywhere. Accelerate ',
        'targetedText': 'Your Future and beyond.',
        'image': Assets.imagesOn3,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: MyText(
              onTap: () => Get.offAll(() => Login()),
              text: 'Skip',
              size: 14,
              weight: FontWeight.w600,
              paddingRight: 20,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 220),
              reverseDuration: Duration(milliseconds: 220),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeInOut,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                key: Key(_currentIndex.toString()),
                children: [
                  Expanded(
                    child: Image.asset(
                      _onBoardingContent[_currentIndex]['image']!,
                      alignment: Alignment.centerRight,
                      width: Get.width,
                    ),
                  ),
                  MyText(
                    paddingTop: 20,
                    paddingLeft: 20,
                    paddingRight: 20,
                    paddingBottom: 4,
                    text: _onBoardingContent[_currentIndex]['title']!,
                    size: 28,
                    color: kTertiaryColor,
                    weight: FontWeight.w300,
                    fontFamily: AppFonts.GIL_SANS,
                  ),
                  if (_onBoardingContent[_currentIndex]['subTitle']!.isNotEmpty)
                    MyText(
                      paddingBottom: 4,
                      paddingLeft: 20,
                      paddingRight: 20,
                      text: _onBoardingContent[_currentIndex]['subTitle']!,
                      size: 28,
                      color: kTertiaryColor,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
                    ),
                  Padding(
                    padding: AppSizes.HORIZONTAL,
                    child: IntrinsicWidth(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 9,
                            color: kSecondaryColor,
                            margin: EdgeInsets.only(bottom: 5.5),
                          ),
                          MyText(
                            text: _onBoardingContent[_currentIndex]
                                ['targetedText']!,
                            size: 28,
                            color: kTertiaryColor,
                            weight: FontWeight.w700,
                            fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 220),
                  reverseDuration: Duration(milliseconds: 220),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeInOut,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: _currentIndex == 2
                      ? MyText(
                          key: Key(_currentIndex.toString()),
                          text: 'Start learning!',
                          size: 28,
                          weight: FontWeight.bold,
                        )
                      : Row(
                          key: Key(_currentIndex.toString()),
                          children: List.generate(
                            _onBoardingContent.length,
                            (index) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 220),
                                height: 10,
                                width: _currentIndex == index ? 20 : 10,
                                margin: EdgeInsets.only(right: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: _currentIndex == index
                                      ? kSecondaryColor
                                      : kTertiaryColor.withOpacity(0.1),
                                ),
                              );
                            },
                          ),
                        ),
                ),
                CircularStepProgressIndicator(
                  totalSteps: 3,
                  height: 92,
                  currentStep: _currentIndex + 1,
                  width: 92,
                  padding: 0.0,
                  unselectedColor: kTertiaryColor.withOpacity(0.1),
                  selectedColor: kSecondaryColor,
                  selectedStepSize: 2.0,
                  unselectedStepSize: 2.0,
                  roundedCap: (_, isSelected) => isSelected,
                  child: Container(
                    height: 68,
                    width: 68,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _onPageChanged,
                        splashColor: kPrimaryColor.withOpacity(0.1),
                        highlightColor: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                        child: Center(
                          child: GestureDetector(
                            child: Image.asset(
                              Assets.imagesArrowOnBoarding,
                              width: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
