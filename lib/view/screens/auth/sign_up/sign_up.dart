import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/auth/login.dart';
import 'package:e_learning_app/view/screens/auth/sign_up/complete_profile.dart';
import 'package:e_learning_app/view/widget/custom_check_box_widget.dart';
import 'package:e_learning_app/view/widget/headings_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/social_login_%20widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: AppSizes.DEFAULT,
        children: [
          AuthHeading(
            title: 'Create an account',
            subTitle:
                'Fill your information below or register\nwith you social account',
          ),
          MyTextField(
            labelText: 'Email',
            prefix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesEmail,
                  height: 20,
                ),
              ],
            ),
          ),
          MyTextField(
            prefix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesPassword,
                  height: 20,
                ),
              ],
            ),
            labelText: 'Password',
            isObSecure: true,
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
            prefix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesPassword,
                  height: 20,
                ),
              ],
            ),
            labelText: 'Confirm Password',
            isObSecure: true,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomCheckBox(
                onTap: () {},
                isActive: true,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: kTertiaryColor,
                      fontFamily: AppFonts.GIL_SANS,
                    ),
                    children: [
                      TextSpan(
                        text: 'Agree with ',
                      ),
                      TextSpan(
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () => Get.to(
                        //         () => Terms(),
                        //       ),
                        text: 'Terms & Conditions',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          MyButton(
            onTap: () {
              Get.to(() => CompleteProfile());
            },
            buttonText: 'Sign up',
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 21.82, 0, 20.77),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 0.9,
                    color: kBorderColor,
                  ),
                ),
                MyText(
                  text: 'Or Sign up with',
                  size: 10.87,
                  color: kTertiaryColor,
                  paddingLeft: 16.05,
                  paddingRight: 16.05,
                ),
                Expanded(
                  child: Container(
                    height: 0.9,
                    color: kBorderColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SocialLogin(
                  onTap: () {},
                  icon: Assets.imagesApple,
                ),
              ),
              SizedBox(
                width: 13.79,
              ),
              Expanded(
                child: SocialLogin(
                  onTap: () {},
                  icon: Assets.imagesGoogle,
                ),
              ),
              SizedBox(
                width: 13.79,
              ),
              Expanded(
                child: SocialLogin(
                  onTap: () {},
                  icon: Assets.imagesFacebook,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            children: [
              MyText(
                text: 'Already have an account?',
              ),
              MyText(
                onTap: () => Get.offAll(() => Login()),
                text: 'Sign in'.toUpperCase(),
                color: kSecondaryColor,
                decoration: TextDecoration.underline,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
