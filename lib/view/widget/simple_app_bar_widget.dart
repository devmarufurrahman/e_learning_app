import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar simpleAppBar({
  final String? title,
  final VoidCallback? onBackTap,
  final List<Widget>? actions,
  bool? haveRoundedBack = true,
  bool? haveLeading = true,
}) {
  return AppBar(
    centerTitle: true,
    leadingWidth: 70,
    leading: !haveLeading!
        ? null
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              haveRoundedBack!
                  ? GestureDetector(
                      onTap: onBackTap ?? () => Get.back(),
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
                  : GestureDetector(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        Assets.imagesArrowBack,
                        height: 14,
                        color: kTertiaryColor,
                      ),
                    ),
            ],
          ),
    title: MyText(
      text: title ?? '',
      size: 22,
      weight: FontWeight.w700,
      fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
    ),
    actions: actions,
  );

}
