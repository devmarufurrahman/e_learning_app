import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class SendField extends StatelessWidget {
  SendField({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onTap,
    this.validator,
    this.onAttachmentTap,
    this.onEmojiTap,
    this.onSendTap,
  }) : super(key: key);
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onEmojiTap, onAttachmentTap, onSendTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes.DEFAULT,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        border: Border(
          top: BorderSide(
            color: Color(0xffEDEDED),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onEmojiTap,
            child: Image.asset(
              Assets.imagesEmoji,
              height: 23.99,
              color: kDarkGreyColor,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: TextFormField(
                cursorColor: kTertiaryColor,
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
                onTap: onTap,
                onChanged: onChanged,
                validator: validator,
                autovalidateMode: AutovalidateMode.always,
                cursorWidth: 1.0,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kPrimaryColor,
                  hintText: 'Write a message...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: onAttachmentTap,
                        child: Image.asset(
                          Assets.imagesAttachment,
                          height: 23.99,
                          color: kDarkGreyColor,
                        ),
                      ),
                    ],
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: onSendTap,
            child: Container(
              height: 39.98,
              width: 39.98,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor,
              ),
              child: Center(
                child: Image.asset(
                  Assets.imagesMic,
                  height: 23.99,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
