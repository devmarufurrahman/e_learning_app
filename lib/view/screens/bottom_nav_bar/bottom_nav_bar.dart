import 'dart:io';
import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_images.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/bookmarked/bookmarked.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/chat/chat_head.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/home/home/home.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/my_courses/my_courses.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  void _getCurrentIndex(int index) => setState(() {
        _currentIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {
        'icon': Assets.imagesHomeB,
        'iconA': Assets.imagesHomeA,
        'label': 'Home',
      },
      {
        'icon': Assets.imagesBookB,
        'iconA': Assets.imagesBookA,
        'label': 'My Course',
      },
      {
        'icon': Assets.imagesBookMarkedB,
        'iconA': Assets.imagesBookMarkedA,
        'label': 'Bookmark',
      },
      {
        'icon': Assets.imagesChatB,
        'iconA': Assets.imagesChatA,
        'label': 'Chat',
      },
      {
        'icon': Assets.imagesProfileB,
        'iconA': Assets.imagesProfileA,
        'label': 'Profile',
      },
    ];

    final List<Widget> _screens = [
      Home(),
      MyCourses(),
      Bookmarked(),
      ChatHead(),
      Profile(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: Platform.isIOS ? null : 70,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -4),
              blurRadius: 30,
              spreadRadius: -2,
              color: kTertiaryColor.withOpacity(0.10),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          backgroundColor: Colors.transparent,
          selectedItemColor: kSecondaryColor,
          unselectedItemColor: kDarkGreyColor,
          currentIndex: _currentIndex,
          onTap: (index) => _getCurrentIndex(index),
          items: List.generate(
            _items.length,
            (index) {
              var data = _items[index];
              return BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Image.asset(
                    _currentIndex == index ? data['iconA'] : data['icon'],
                    height: 22,
                  ),
                ),
                label: data['label'].toString().tr,
              );
            },
          ),
        ),
      ),
    );
  }
}
