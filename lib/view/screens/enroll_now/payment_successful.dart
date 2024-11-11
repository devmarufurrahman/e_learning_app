import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/view/screens/enroll_now/e_receipt.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PaymentSuccessful extends StatelessWidget {
  PaymentSuccessful({
    required this.congratsMsg,
    required this.onContinue,
    this.buttonText,
  });

  String? congratsMsg, buttonText;
  VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Image.asset(
            Assets.imagesCongrats,
            height: 150,
          ),
          MyText(
            paddingTop: 40,
            text: 'Congratulations!',
            size: 32,
            textAlign: TextAlign.center,
            weight: FontWeight.w700,
            fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
          ),
          MyText(
            paddingTop: 10,
            paddingBottom: 60,
            text: congratsMsg ?? '',
            size: 14,
            color: kDarkGreyColor.withOpacity(0.8),
            weight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyButton(
                  buttonText: 'View E-Receipt',
                  onTap: () {
                    Get.to(() => EReceipt());
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                MyBorderButton(
                  onTap: onContinue,
                  buttonText: buttonText ?? 'Go to Course',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
