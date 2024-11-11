import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class CourseReviews extends StatelessWidget {
  const CourseReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSizes.VERTICAL,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          children: [
            MyText(
              paddingLeft: 20,
              text: 'Reviews ',
              size: 16,
              weight: FontWeight.w600,
            ),
            MyText(
              text: '(45)',
              size: 16,
              color: kSecondaryColor,
              weight: FontWeight.w600,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            shrinkWrap: true,
            padding: AppSizes.HORIZONTAL,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              final List<String> _items = [
                'Latest',
                'Verified',
                'Detailed Reviews',
                '5.0',
                '4.0',
                '3.0',
                '2.0',
                '1.0',
              ];
              return MyToggleButton(
                buttonText: _items[index],
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
        SizedBox(
          height: 20,
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: AppSizes.HORIZONTAL,
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return _ReviewCard(
              name: 'Anita Cruz',
              image: dummyImg,
              rating: 3.0,
              review:
                  'My wife & I have moved 6 times in the last 25 years. Obviously, we\'ve dealt with many realtors both on the buying and selling side. I have to say that David is by far the BEST realtor we\'ve ever worked with, his professionalism, personality, attention to detail, responsiveness and',
              time: '11 months ago',
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

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({
    required this.image,
    required this.name,
    required this.review,
    required this.rating,
    required this.time,
  });

  final String image, name, review, time;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImageView(
              height: 40,
              width: 40,
              radius: 100.0,
              url: image,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    paddingLeft: 4,
                    text: name,
                    size: 15,
                    weight: FontWeight.w500,
                    paddingBottom: 2,
                  ),
                  RatingBar(
                    initialRating: rating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    updateOnDrag: false,
                    glow: false,
                    tapOnlyMode: false,
                    itemCount: 5,
                    unratedColor: kDarkGreyColor.withOpacity(0.2),
                    ratingWidget: RatingWidget(
                      full: Image.asset(
                        Assets.imagesStar,
                        height: 12,
                      ),
                      half: Image.asset(
                        Assets.imagesStar,
                        height: 12,
                      ),
                      empty: Image.asset(
                        Assets.imagesStar,
                        height: 12,
                        color: kDarkGreyColor.withOpacity(0.2),
                      ),
                    ),
                    itemSize: 12,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 2,
              text: time,
              size: 12,
              color: kDarkGreyColor.withOpacity(0.6),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        ReadMoreText(
          review,
          trimLines: 2,
          colorClickableText: kSecondaryColor,
          trimMode: TrimMode.Length,
          trimCollapsedText: ' Read more',
          trimExpandedText: ' Read less',
          style: TextStyle(
            fontSize: 13,
            color: kDarkGreyColor,
            fontFamily: AppFonts.AVENIR,
            height: 1.4,
          ),
          moreStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: kSecondaryColor,
            fontFamily: AppFonts.AVENIR,
          ),
          lessStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: kSecondaryColor,
            fontFamily: AppFonts.AVENIR,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 0.8,
          color: kTertiaryColor.withOpacity(0.1),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
