import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/auth/sign_up/phone_verification.dart';
import 'package:e_learning_app/view/widget/custom_drop_down.dart';
import 'package:e_learning_app/view/widget/headings_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CompleteProfile extends StatelessWidget {
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
            title: 'Personal Info',
            subTitle:
                'Don\'t worry, only you can see your personal\ndata. No one else will  be able to see it.',
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kDarkGreyColor.withOpacity(0.065),
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.imagesUser,
                      height: 50,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 6,
                  child: Image.asset(
                    Assets.imagesAdd,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          MyTextField(
            labelText: 'Name',
            hintText: 'John Doe',
          ),
          PhoneField(),
          CustomDropDown(
            heading: 'Gender',
            hint: 'Select',
            items: [
              'Select',
              'Male',
              'Female',
            ],
            selectedValue: 'Select',
            onChanged: (v) {},
          ),
          SizedBox(
            height: 14,
          ),
          MyButton(
            onTap: () => Get.to(() => PhoneVerification()),
            buttonText: 'Complete Profile',
          ),
        ],
      ),
    );
  }
}
