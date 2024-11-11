import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:e_learning_app/view/widget/congratulation_widget.dart';
import 'package:e_learning_app/view/widget/headings_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class PhoneVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DEFAULT_THEME = PinTheme(
      width: 60,
      height: 60,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.only(top: 7),
      textStyle: TextStyle(
        fontSize: 24,
        height: 0.0,
        fontWeight: FontWeight.w600,
        color: kTertiaryColor,
        fontFamily: AppFonts.GIL_SANS,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: kTertiaryColor.withOpacity(0.16),
        ),
        color: kBorderColor,
        shape: BoxShape.circle,
      ),
    );
    return Scaffold(
      appBar: simpleAppBar(
        title: '',
        haveRoundedBack: false,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          AuthHeading(
            marginTop: 0.0,
            title: 'OTP Verification',
            subTitle: '',
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.GIL_SANS,
                color: kTertiaryColor.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text:
                      'Enter the 4-digit that we have sent via the phone number',
                ),
                TextSpan(
                  text: ' +62 813-****-5977',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Pinput(
            length: 4,
            onChanged: (value) {},
            pinContentAlignment: Alignment.center,
            defaultPinTheme: DEFAULT_THEME,
            focusedPinTheme: DEFAULT_THEME,
            submittedPinTheme: DEFAULT_THEME,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            separatorBuilder: (index) {
              return SizedBox(
                width: 15,
              );
            },
            onCompleted: (pin) => print(pin),
          ),
          SizedBox(
            height: 40,
          ),
          MyButton(
            onTap: () => Get.to(
              () => Congratulations(
                congratsMsg: 'Account created successfully!',
                onContinue: () {
                  Get.offAll(() => BottomNavBar());
                },
              ),
            ),
            buttonText: 'Continue',
          ),
          MyText(
            text: 'Try again in 29 seconds',
            color: kTertiaryColor,
            textAlign: TextAlign.center,
            paddingTop: 24,
          ),
          MyText(
            paddingTop: 20,
            text: 'Resend code'.toUpperCase(),
            size: 16,
            weight: FontWeight.w600,
            color: kSecondaryColor,
            decoration: TextDecoration.underline,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
