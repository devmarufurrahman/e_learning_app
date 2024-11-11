import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/auth/forgot_pass/change_password.dart';
import 'package:e_learning_app/view/widget/headings_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: '',
        haveRoundedBack: false,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: AppSizes.DEFAULT,
        children: [
          AuthHeading(
            marginTop: 0.0,
            title: 'Forgot password?',
            subTitle:
                'Enter your email address below, and we\'ll send you a link to reset your password.',
          ),
          MyTextField(
            labelText: 'Email',
            hintText: 'Enter your email address',
            prefix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesEmail,
                  height: 20,
                ),
              ],
            ),
            marginBottom: 30,
          ),
          MyButton(
            onTap: () => Get.to(
              () => ChangePassword(),
            ),
            buttonText: 'Send',
          ),
        ],
      ),
    );
  }
}
