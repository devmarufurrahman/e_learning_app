import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/widget/custom_drop_down.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Edit Profile',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.DEFAULT,
              physics: BouncingScrollPhysics(),
              children: [
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
                        bottom: 10,
                        child: Image.asset(
                          Assets.imagesEdit,
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
                MyTextField(
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                ),
                MyTextField(
                  labelText: 'DOB',
                  hintText: 'DD/MM/YY',
                ),
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
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Update Profile',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
