import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/utils/all_categories_list.dart';
import 'package:e_learning_app/view/widget/bottom_sheets/custom_bottom_sheet_widget.dart';
import 'package:e_learning_app/view/widget/course_wigdet.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bookmarked extends StatelessWidget {
  const Bookmarked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: simpleAppBar(
        title: 'Bookmarked',
        haveLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: AppSizes.HORIZONTAL,
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
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              shrinkWrap: true,
              padding: AppSizes.HORIZONTAL,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: allCategories.length,
              itemBuilder: (context, index) {
                return MyToggleButton(
                  buttonText: allCategories[index]['title'],
                  onTap: () {},
                  isSelected: index == 2,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10,
                );
              },
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: AppSizes.HORIZONTAL,
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
                  isBookmarked: true,
                  isBestSeller: index.isEven,
                  onTap: () {},
                  onBookmark: () {
                    Get.bottomSheet(
                      CustomBottomSheet(
                        height: 400,
                        title: 'Remove from favorites?',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
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
                                haveBookmarkIcon: false,
                                onTap: () {},
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyBorderButton(
                                    buttonText: 'Cancel',
                                    onTap: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: MyButton(
                                    buttonText: 'Yes, Remove',
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      isScrollControlled: true,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
