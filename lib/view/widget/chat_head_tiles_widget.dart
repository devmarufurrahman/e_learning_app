import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatHeadTiles extends StatelessWidget {
  ChatHeadTiles({
    Key? key,
    required this.profileImage,
    required this.name,
    required this.lastMsg,
    required this.time,
    this.unreadCount = 0,
    required this.onTap,
    required this.isOnline,
    required this.isAway,
    required this.isNewMessage,
  }) : super(key: key);

  final String profileImage, name, lastMsg, time;
  int? unreadCount;
  final VoidCallback onTap;
  final bool isOnline, isAway, isNewMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isNewMessage
            ? kSecondaryColor.withOpacity(0.10)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kSecondaryColor.withOpacity(0.1),
          highlightColor: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CommonImageView(
                      height: 47,
                      width: 47,
                      url: profileImage,
                      fit: BoxFit.cover,
                      radius: 100,
                    ),
                    Positioned(
                      right: 2,
                      bottom: 0,
                      child: Container(
                        height: 11.84,
                        width: 11.84,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.97,
                            color: kPrimaryColor,
                          ),
                          shape: BoxShape.circle,
                          color: isOnline
                              ? kOnlineColor
                              : isAway
                                  ? kAwayColor
                                  : kOfflineColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: name,
                        weight: FontWeight.w600,
                        paddingBottom: 2,
                        size: 16,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            Assets.imagesDoubleTick,
                            height: 20,
                            color: kSecondaryColor,
                          ),
                          Expanded(
                            child: MyText(
                              paddingLeft: 4,
                              text: lastMsg,
                              size: 14,
                              // color: kGreyColor6,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    MyText(
                      paddingTop: unreadCount! > 0 ? 10 : 0,
                      text: time,
                      size: 10.72,
                      // color: kGreyColor5,
                      paddingBottom: unreadCount! > 0 ? 5 : 0,
                    ),
                    unreadCount! > 0
                        ? Container(
                            margin: EdgeInsets.only(bottom: 5),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kSecondaryColor,
                            ),
                            child: Center(
                              child: MyText(
                                text: unreadCount.toString(),
                                size: 8.77,
                                paddingLeft: 1,
                                weight: FontWeight.w700,
                                color: kPrimaryColor,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
