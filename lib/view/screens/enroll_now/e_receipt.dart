import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EReceipt extends StatelessWidget {
  const EReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'E-Receipt',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.DEFAULT,
              physics: BouncingScrollPhysics(),
              children: [
                Image.asset(
                  Assets.imagesBarcode,
                  height: 60,
                  width: Get.width,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 16),
                  height: 1,
                  color: kTertiaryColor.withOpacity(0.1),
                ),
                _InfoRow(
                  title: 'Purchase Date',
                  subTitle: 'August 24, 2023 | 10:00 AM',
                ),
                _InfoRow(
                  title: 'Mentor',
                  subTitle: 'Robert Green',
                ),
                _InfoRow(
                  title: 'Language',
                  subTitle: 'English',
                ),
                _InfoRow(
                  title: 'Lessons',
                  subTitle: '32',
                ),
                _InfoRow(
                  title: 'Level',
                  subTitle: 'Beginner',
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 16),
                  height: 1,
                  color: kTertiaryColor.withOpacity(0.1),
                ),
                _InfoRow(
                  title: 'Amount',
                  subTitle: '\$180.00',
                ),
                _InfoRow(
                  title: 'Tax',
                  subTitle: '\$5.00',
                ),
                SizedBox(
                  height: 20,
                ),
                _InfoRow(
                  title: 'Total',
                  subTitle: '\$185.00',
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 16),
                  height: 1,
                  color: kTertiaryColor.withOpacity(0.1),
                ),
                _InfoRow(
                  title: 'Payment Method',
                  subTitle: 'Apple Pay',
                ),
                _InfoRow(
                  title: 'Payment Status',
                  subTitle: 'Paid',
                ),
                _InfoRow(
                  title: 'Transaction ID',
                  subTitle: '#re2564hg23'.toUpperCase(),
                ),
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Download E-Receipt',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            text: title,
            size: 14,
            weight: FontWeight.w500,
            color: kDarkGreyColor,
          ),
          MyText(
            text: subTitle,
            size: 14,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
