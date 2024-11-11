import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CreditCardsTiles extends StatelessWidget {
  CreditCardsTiles({
    Key? key,
    required this.cardType,
    required this.expiry,
    required this.lastDigits,
    required this.onTap,
    required this.onEditTap,
    required this.onSetAsDefaultTap,
    this.isDefault = false,
    this.isSelected = false,
    this.showDefault = true,
  }) : super(key: key);

  final String? cardType, expiry, lastDigits;
  bool? isDefault, isSelected, showDefault;

  VoidCallback onTap, onEditTap, onSetAsDefaultTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: kTertiaryColor.withOpacity(0.065),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: kTertiaryColor.withOpacity(0.1),
          width: 1.0,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        splashColor: kDarkGreyColor.withOpacity(0.05),
        highlightColor: kDarkGreyColor.withOpacity(0.05),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: showDefault!
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Container(
                width: 46,
                height: 32,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: kTertiaryColor.withOpacity(0.2),
                    width: 1.0,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    cardType == 'Apple Pay'
                        ? Assets.imagesApplePay
                        : cardType == 'Mastercard'
                            ? Assets.imagesMasterCard
                            : Assets.imagesVisa,
                    height: 11,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyText(
                          text: isDefault!
                              ? '$cardType'
                              : '$cardType ending in $lastDigits',
                          weight: FontWeight.w600,
                          size: 14,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kSecondaryColor,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              height: Get.height,
                              width: Get.width,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected!
                                    ? kSecondaryColor
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    showDefault!
                        ? isDefault!
                            ? MyText(
                                text: 'Default',
                                paddingTop: 3,
                                color: kDarkGreyColor,
                              )
                            : SizedBox()
                        : SizedBox(),
                    isDefault!
                        ? SizedBox()
                        : MyText(
                            text: '$expiry',
                            paddingTop: 3,
                            paddingBottom: 8,
                            color: kDarkGreyColor,
                          ),
                    showDefault!
                        ? isDefault!
                            ? SizedBox()
                            : Wrap(
                                spacing: 15,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  MyText(
                                    onTap: () {},
                                    text: 'Set as default',
                                    color: kDarkGreyColor,
                                  ),
                                  MyText(
                                    onTap: () {},
                                    text: 'Edit',
                                    color: kSecondaryColor,
                                  ),
                                ],
                              )
                        : SizedBox(),
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
