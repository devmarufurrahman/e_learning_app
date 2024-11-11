import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/chat_screen.dart';
import 'package:e_learning_app/view/widget/chat_head_tiles_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHead extends StatelessWidget {
  const ChatHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 3,
              shadowColor: kTertiaryColor.withOpacity(0.16),
              backgroundColor: kPrimaryColor,
              pinned: true,
              automaticallyImplyLeading: false,
              centerTitle: true,
              expandedHeight: 120,
              title: MyText(
                text: 'Chat',
                size: 22,
                weight: FontWeight.w700,
                fontFamily: AppFonts.GIL_SANS_DISPLAY_MT_PRO,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: AppSizes.DEFAULT,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              color: kTertiaryColor.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: MyTextField(
                          marginBottom: 0.0,
                          hintText: 'Search',
                          filledColor: kPrimaryColor,
                          prefix: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.imagesSearchNew,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ChatHeadTiles(
              profileImage: dummyImg,
              name: 'Josiah Zayner',
              lastMsg: 'How are you today?',
              time: index == 0 ? '18.31' : 'Yesterday',
              unreadCount: index == 0 ? 3 : 0,
              onTap: () => Get.to(() => ChatScreen()),
              isNewMessage: index == 0,
              isOnline: index == 2 ? false : true,
              isAway: index == 2 ? true : false,
            );
          },
        ),
      ),
    );
  }
}
