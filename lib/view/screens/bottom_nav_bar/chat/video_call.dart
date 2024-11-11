import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCall extends StatefulWidget {
  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  bool isVideo = true;

  void onAudio() {
    setState(() {
      isVideo = !isVideo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            //PLACE VIDEO CALL PACKAGE HERE
            if (isVideo)
              CommonImageView(
                height: Get.height,
                width: Get.width,
                radius: 0.0,
                url: dummyImg,
              )
            else
              Container(
                height: Get.height,
                width: Get.width,
                color: kTertiaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            spreadRadius: 4,
                            color: kSecondaryColor.withOpacity(0.26),
                          ),
                        ],
                        border: Border.all(
                          width: 2.0,
                          color: kSecondaryColor,
                        ),
                      ),
                      child: CommonImageView(
                        height: 200,
                        width: 160,
                        radius: 16,
                        url: dummyImg,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            Image.asset(
              Assets.imagesMeetingEffect,
              height: Get.height,
              width: Get.width,
              color: kSecondaryColor,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 50,
              left: 20,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: kPrimaryColor,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.imagesArrowBack,
                      height: 14,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
            if (isVideo)
              Positioned(
                top: 50,
                right: 20,
                child: CommonImageView(
                  width: 100,
                  height: 130,
                  radius: 10.0,
                  url: dummyImages[3],
                ),
              ),
            Positioned(
              bottom: 160,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Back Man',
                    size: 24,
                    weight: FontWeight.w600,
                    color: kPrimaryColor,
                    paddingBottom: 4,
                  ),
                  Container(
                    height: 23,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: kPrimaryColor.withOpacity(0.1),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                        MyText(
                          paddingLeft: 8,
                          paddingRight: 8,
                          text: '5:49',
                          size: 12,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: Get.height * 0.085,
              left: 0,
              right: 0,
              child: Container(
                height: 56.57,
                width: 56.57,
                padding: EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Center(
                  child: Image.asset(
                    Assets.imagesCallEnd,
                    height: 34,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _navItem(
                      icon: Assets.imagesSpeakerNew,
                      onTap: () {},
                    ),
                    _navItem(
                      icon: Assets.imagesMute,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                    ),
                    _navItem(
                      icon: Assets.imagesOffCamera,
                      onTap: onAudio,
                    ),
                    _navItem(
                      icon: Assets.imagesMessage,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    String? icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: kPrimaryColor,
        ),
        child: Center(
          child: Image.asset(
            icon!,
            height: 20,
          ),
        ),
      ),
    );
  }
}
