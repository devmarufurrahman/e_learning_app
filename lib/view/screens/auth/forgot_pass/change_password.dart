import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/auth/login.dart';
import 'package:e_learning_app/view/widget/congratulation_widget.dart';
import 'package:e_learning_app/view/widget/headings_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            title: 'New password',
            subTitle:
                'Your new password must be different\nfrom previously used password.',
          ),
          // MyText(
          //   text:
          //       'Your new password must be different from previously used password.',
          //   size: 16,
          //   color: kTertiaryColor.withOpacity(0.7),
          //   weight: FontWeight.w500,
          //   paddingBottom: 20,
          // ),
          MyTextField(
            labelText: 'Password',
            prefix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesPassword,
                  height: 20,
                ),
              ],
            ),
            suffix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesVisibility,
                  height: 20,
                ),
              ],
            ),
          ),
          MyTextField(
            labelText: 'Confirm password',
            prefix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesPassword,
                  height: 20,
                ),
              ],
            ),
            suffix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesVisibility,
                  height: 20,
                ),
              ],
            ),
            marginBottom: 40.0,
          ),
          MyButton(
            onTap: () => Get.off(
              () => Congratulations(
                congratsMsg: 'Password changed successfully!',
                buttonText: 'Continue to sign in',
                onContinue: () => Get.offAll(() => Login()),
              ),
            ),
            buttonText: 'Change password',
          ),
        ],
      ),
    );
  }
}
