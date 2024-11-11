import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/contact_us.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/edit_profile.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/help_center.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/payment_methods/payment_methods.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/terms_and_policies/policies.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/settings.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/terms_and_policies/terms.dart';
import 'package:e_learning_app/view/widget/bottom_sheets/custom_bottom_sheet_widget.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/profile_tlie_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              centerTitle: true,
              pinned: true,
              backgroundColor: kSecondaryColor,
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              expandedHeight: 250,
              title: MyText(
                text: 'Profile',
                size: 22,
                color: kPrimaryColor,
                weight: FontWeight.w700,
                fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: AppSizes.DEFAULT,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(18),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.imagesAppBarBg,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Container(
                          height: 115,
                          width: 115,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                color: kTertiaryColor.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: CommonImageView(
                            height: Get.height,
                            width: Get.width,
                            radius: 100.0,
                            url: dummyImg,
                          ),
                        ),
                      ),
                      MyText(
                        paddingTop: 10,
                        text: 'John Doe',
                        size: 20,
                        color: kPrimaryColor,
                        weight: FontWeight.w700,
                        textAlign: TextAlign.center,
                        paddingBottom: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.VERTICAL,
          physics: BouncingScrollPhysics(),
          children: [
            ProfileTile(
              icon: Assets.imagesUserProfileNew,
              title: 'Edit Profile',
              onTap: () {
                Get.to(() => EditProfile());
              },
            ),
            ProfileTile(
              icon: Assets.imagesPaymentMethod,
              title: 'Payment Methods',
              onTap: () {
                Get.to(() => PaymentMethods());
              },
            ),
            ProfileTile(
              icon: Assets.imagesSettings,
              title: 'Settings',
              onTap: () {
                Get.to(() => Settings());
              },
            ),
            ProfileTile(
              icon: Assets.imagesInfo,
              title: 'Help Center',
              onTap: () {
                Get.to(() => HelpAndSupport());
              },
            ),
            ProfileTile(
              icon: Assets.imagesMessage,
              title: 'Terms & Conditions',
              onTap: () {
                Get.to(() => Terms());
              },
            ),
            ProfileTile(
              icon: Assets.imagesPrivacy,
              title: 'Privacy Policy',
              onTap: () {
                Get.to(() => Policies());
              },
            ),
            ProfileTile(
              icon: Assets.imagesContactUs,
              title: 'Contact Us',
              onTap: () {
                Get.to(() => ContactUs());
              },
            ),
            ProfileTile(
              icon: Assets.imagesLogout,
              title: 'Logout',
              onTap: () {
                Get.bottomSheet(
                  CustomBottomSheet(
                    height: 200,
                    title: 'Logout',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: 'Are you sure you want to logout?',
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
      ),
    );
  }
}
