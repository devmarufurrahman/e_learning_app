import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Contact Us',
      ),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          _ContactUsTile(
            icon: Assets.imagesWhatsapp,
            title: 'WhatsApp',
            onTap: () {},
          ),
          _ContactUsTile(
            icon: Assets.imagesFb,
            title: 'Facebook',
            onTap: () {},
          ),
          _ContactUsTile(
            icon: Assets.imagesInsta,
            title: 'Instagram',
            onTap: () {},
          ),
          _ContactUsTile(
            icon: Assets.imagesTwitter,
            title: 'Twitter',
            onTap: () {},
          ),
          _ContactUsTile(
            icon: Assets.imagesSkype,
            title: 'Skype',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _ContactUsTile extends StatelessWidget {
  const _ContactUsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            color: kTertiaryColor.withOpacity(0.16),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: kTertiaryColor.withOpacity(0.05),
          highlightColor: kTertiaryColor.withOpacity(0.05),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  height: 22,
                ),
                Expanded(
                  child: MyText(
                    paddingLeft: 12,
                    text: title,
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                ),
                Image.asset(
                  Assets.imagesArrowNext,
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
