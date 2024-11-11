import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/video_call.dart';
import 'package:e_learning_app/view/widget/chat_bubble_widget.dart';
import 'package:e_learning_app/view/widget/common_image_view_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/send_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> chat = [
    {
      'isMe': true,
      'msg': 'Really!',
      'otherUserName': 'Marley Calzoni',
      'otherUserImg': dummyImg,
      'msgTime': '3:53 PM',
      'haveTaskBubble': false,
      'taskDetail': {},
    },
    {
      'isMe': false,
      'msg': 'Yeah, It’s really good!',
      'otherUserName': 'Marley Calzoni',
      'otherUserImg': dummyImg,
      'msgTime': '3:53 PM',
      'haveTaskBubble': false,
      'taskDetail': {},
    },
    {
      'isMe': false,
      'msg': 'Hi, Alex! Welcome to our team',
      'otherUserName': 'Max',
      'otherUserImg': dummyImg,
      'msgTime': '3:53 PM',
      'haveTaskBubble': true,
      'taskDetail': {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        shadowColor: kTertiaryColor.withOpacity(0.16),
        automaticallyImplyLeading: false,
        title: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  Assets.imagesArrowBack,
                  height: 12,
                ),
              ),
              SizedBox(
                width: 19,
              ),
              CommonImageView(
                height: 40,
                width: 40,
                url: dummyImg,
                radius: 100.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      paddingTop: 10,
                      paddingLeft: 12,
                      text: 'Max',
                      size: 18,
                      lineHeight: 0.5,
                      weight: FontWeight.w600,
                    ),
                    // MyText(
                    //   paddingLeft: 12,
                    //   text: 'Online',
                    //   size: 10,
                    //   color: kOnlineColor,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: () => Get.to(() => VideoCall()),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightYellowColor.withOpacity(0.5),
                ),
                child: Center(
                  child: Image.asset(
                    Assets.imagesVideoCall,
                    height: 22,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 15,
              ),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kLightYellowColor.withOpacity(0.5),
              ),
              child: Center(
                child: Image.asset(
                  Assets.imagesMore,
                  height: 18,
                  color: kDarkGreyColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chat.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(15, 60, 15, 100),
              itemBuilder: (context, index) {
                var data = chat[index];
                return ChatBubble(
                  isMe: data['isMe'],
                  myImg: dummyImg,
                  msg: data['msg'],
                  otherUserImg: data['otherUserImg'],
                  otherUserName: data['otherUserName'],
                  msgTime: data['msgTime'],
                  images: index == 2
                      ? [
                          dummyImages[0],
                          dummyImages[1],
                          dummyImages[2],
                          dummyImages[3],
                        ]
                      : [],
                  haveImages: index == 2,
                );
              },
            ),
          ),
          SendField(),
        ],
      ),
    );
  }
}
