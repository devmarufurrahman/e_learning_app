import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/auth/forgot_pass/forgot_password.dart';
import 'package:e_learning_app/view/screens/auth/sign_up/sign_up.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:e_learning_app/view/widget/headings_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/social_login_%20widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: AppSizes.DEFAULT,
        children: [
          AuthHeading(
            title: 'Sign in',
            subTitle: 'Hi, Welcome back, you\'ve been missed',
          ),
          MyTextField(
            labelText: 'Email',
            hintText: 'email@example.com',
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
            labelText: 'Password',
            hintText: '********',
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
            isObSecure: true,
            marginBottom: 10.0,
          ),
          MyText(
            onTap: () => Get.to(() => ForgotPassword()),
            text: 'Forgot password?',
            size: 14,
            weight: FontWeight.w600,
            textAlign: TextAlign.end,
            color: kSecondaryColor,
          ),
          SizedBox(
            height: 40,
          ),
          MyButton(
            onTap: () => Get.to(() => BottomNavBar()),
            buttonText: 'Sign in',
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
                  text: 'Or Sign in with',
                  size: 12,
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
                text: 'Don’t have an account?',
              ),
              MyText(
                onTap: () => Get.to(() => SignUp()),
                text: 'Sign up'.toUpperCase(),
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
