import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/auth/forgot_pass/forgot_password.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordManager extends StatelessWidget {
  const PasswordManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Password Manager',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.DEFAULT,
              physics: BouncingScrollPhysics(),
              children: [
                MyTextField(
                  labelText: 'Current Password',
                  hintText: '********',
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesVisibility,
                        height: 20,
                      ),
                    ],
                  ),
                  isObSecure: true,
                  marginBottom: 10,
                ),
                MyText(
                  onTap: () => Get.to(() => ForgotPassword()),
                  text: 'Forgot password?',
                  size: 14,
                  weight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  textAlign: TextAlign.end,
                  color: kSecondaryColor,
                  paddingBottom: 20,
                ),
                MyTextField(
                  labelText: 'New Password',
                  hintText: '********',
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesVisibility,
                        height: 20,
                      ),
                    ],
                  ),
                  isObSecure: true,
                  marginBottom: 10.0,
                ),
                MyTextField(
                  labelText: 'Confirm New Password',
                  hintText: '********',
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesVisibility,
                        height: 20,
                      ),
                    ],
                  ),
                  isObSecure: true,
                  marginBottom: 10.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Change Password',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
