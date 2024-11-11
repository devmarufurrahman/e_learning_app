import 'dart:async';
import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/view/screens/launch/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/my_text_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Timer(
      Duration(seconds: 2),
      () => Get.offAll(() => OnBoarding()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Center(
        child: MyText(
          text: 'LOGO',
          size: 40,
          color: kPrimaryColor,
          weight: FontWeight.w700,
        ),
      ),
    );
  }
}
