// ignore: must_be_immutable
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    required this.heading,
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.bgColor,
    this.marginBottom,
    this.width,
  });

  final List<dynamic>? items;
  String selectedValue;
  final ValueChanged<dynamic>? onChanged;
  String heading, hint;
  Color? bgColor;
  double? marginBottom, width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom ?? 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (heading.isNotEmpty)
            MyText(
              text: heading,
              size: 13,
              weight: FontWeight.w500,
              paddingBottom: 2,
            ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              items: items!
                  .map(
                    (item) => DropdownMenuItem<dynamic>(
                      value: item,
                      child: MyText(
                        text: item,
                        size: 13,
                        weight: FontWeight.w500,
                        color: kDarkGreyColor,
                      ),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: onChanged,
              isDense: true,
              isExpanded: false,
              customButton: Container(
                height: 48,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: kTertiaryColor.withOpacity(0.065),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: selectedValue == hint ? hint : selectedValue,
                      size: 13,
                      color: selectedValue == hint
                          ? kDarkGreyColor.withOpacity(0.4)
                          : kDarkGreyColor,
                    ),
                    Image.asset(
                      Assets.imagesArrowDropDown,
                      height: 20,
                    ),
                  ],
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 48,
              ),
              dropdownStyleData: DropdownStyleData(
                elevation: 3,
                maxHeight: 300,
                offset: Offset(0, -5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kTertiaryColor.withOpacity(0.06),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
