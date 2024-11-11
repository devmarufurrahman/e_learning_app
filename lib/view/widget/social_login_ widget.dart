import 'package:e_learning_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 0.92,
          color: kBorderColor,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: kSeoulColor2,
          highlightColor: kSeoulColor2,
          child: Center(
            child: Image.asset(
              icon,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
