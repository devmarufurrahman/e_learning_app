import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/password_manager.dart';
import 'package:e_learning_app/view/widget/bottom_sheets/custom_bottom_sheet_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/profile_tlie_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Settings',
      ),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.VERTICAL,
        physics: BouncingScrollPhysics(),
        children: [
          ProfileTile(
            icon: Assets.imagesNotification,
            title: 'Notification Settings',
            onTap: () {},
          ),
          ProfileTile(
            icon: Assets.imagesKey,
            title: 'Password Manager',
            onTap: () {
              Get.to(() => PasswordManager());
            },
          ),
          ProfileTile(
            icon: Assets.imagesDelete,
            title: 'Delete Account',
            onTap: () {
              Get.bottomSheet(
                CustomBottomSheet(
                  height: 220,
                  title: 'Delete Account',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'Are you sure? You\nwant to delete account?',
                        size: 18,
                        color: kDarkGreyColor,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyBorderButton(
                              buttonText: 'Cancel',
                              onTap: () {},
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: MyButton(
                              buttonText: 'Yes, Logout',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isScrollControlled: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
