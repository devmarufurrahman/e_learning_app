import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/utils/all_categories_list.dart';
import 'package:e_learning_app/view/widget/bottom_sheets/custom_bottom_sheet_widget.dart';
import 'package:e_learning_app/view/widget/custom_slider_thumb_widget.dart';
import 'package:e_learning_app/view/widget/custom_slider_tool_tip_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';

class Filter extends StatefulWidget {
  Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final List<String> music = [
    'Pop',
    'Hip Hop',
    'Alternative',
    'Rock',
    'Rhythm and Blues',
  ];

  final List<String> drinks = [
    'Wine',
    'Drink 1',
    'Drink 2',
  ];

  final List<String> bars = [
    'bar 1',
    'bar 2',
    'bar 3',
    'bar 4',
  ];
  double _minPrice = 20;
  double _maxPrice = 70;
  double _minRating = 1.0;
  double _maxRating = 5.0;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      height: Get.height * 0.8,
      title: 'Filter',
      paddingHorizontal: 0.0,
      marginBottom: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                MyText(
                  paddingLeft: 20,
                  text: 'Categories',
                  size: 16,
                  weight: FontWeight.w700,
                  paddingBottom: 6,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 8,
                      );
                    },
                    itemCount: allCategories.length,
                    padding: AppSizes.HORIZONTAL,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MyToggleButton(
                        buttonText: allCategories[index]['title'],
                        isSelected: index == 0,
                        onTap: () {},
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FlutterSlider(
                        values: [
                          _minPrice,
                          _maxPrice,
                        ],
                        rangeSlider: true,
                        min: 20,
                        max: 70,
                        tooltip: CustomSliderToolTip(),
                        handler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: CustomSliderThumb(),
                        ),
                        rightHandler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: CustomSliderThumb(),
                        ),
                        trackBar: FlutterSliderTrackBar(
                          activeTrackBarHeight: 7,
                          inactiveTrackBarHeight: 7,
                          activeTrackBar: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          inactiveTrackBar: BoxDecoration(
                            color: kTertiaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          setState(() {
                            _minPrice = lowerValue;
                            _maxPrice = upperValue;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      top: -6,
                      child: MyText(
                        paddingLeft: 20,
                        text: 'Price Range',
                        size: 16,
                        weight: FontWeight.w700,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: -6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: '\$20',
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                          MyText(
                            text: '\$30',
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                          MyText(
                            text: '\$40',
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                          MyText(
                            text: '\$50',
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                          MyText(
                            text: '\$60',
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                          MyText(
                            text: '\$70',
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FlutterSlider(
                        values: [
                          _minRating,
                          _maxRating,
                        ],
                        rangeSlider: true,
                        min: 1.0,
                        max: 5.0,
                        tooltip: CustomSliderToolTip(),
                        handler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: CustomSliderThumb(),
                        ),
                        rightHandler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: CustomSliderThumb(),
                        ),
                        trackBar: FlutterSliderTrackBar(
                          activeTrackBarHeight: 7,
                          inactiveTrackBarHeight: 7,
                          activeTrackBar: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          inactiveTrackBar: BoxDecoration(
                            color: kTertiaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          setState(() {
                            _minRating = lowerValue;
                            _maxRating = upperValue;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      top: -6,
                      child: MyText(
                        paddingLeft: 20,
                        text: 'Rating',
                        size: 16,
                        weight: FontWeight.w700,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: -6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: '1.0',
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                          MyText(
                            text: '5.0',
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                MyText(
                  paddingTop: 20,
                  paddingLeft: 20,
                  paddingBottom: 6,
                  text: 'Language',
                  size: 16,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 8,
                      );
                    },
                    itemCount: 7,
                    padding: AppSizes.HORIZONTAL,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final List<String> _items = [
                        'English',
                        'German',
                        'French',
                        'Spanish',
                        'Hindi',
                        'Urdu',
                        'Arabic',
                      ];
                      return MyToggleButton(
                        buttonText: _items[index],
                        isSelected: index == 0,
                        onTap: () {},
                      );
                    },
                  ),
                ),
                MyText(
                  paddingTop: 20,
                  paddingLeft: 20,
                  paddingBottom: 6,
                  text: 'Course Duration',
                  size: 16,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 8,
                      );
                    },
                    itemCount: 6,
                    padding: AppSizes.HORIZONTAL,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final List<String> _items = [
                        '30',
                        '60',
                        '75',
                        '90',
                        '120',
                        '145',
                      ];
                      return MyToggleButton(
                        buttonText: _items[index] + ' Minutes',
                        isSelected: index == 0,
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: AppSizes.DEFAULT,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -4),
                  blurRadius: 10,
                  spreadRadius: -2,
                  color: kTertiaryColor.withOpacity(0.10),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: MyBorderButton(
                    buttonText: 'Reset',
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: MyButton(
                    buttonText: 'Apply',
                    onTap: () {},
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
