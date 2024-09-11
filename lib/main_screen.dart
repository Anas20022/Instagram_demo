import 'dart:math';

import 'package:first_project_1/data/post_json.dart';
import 'package:first_project_1/models/post_models.dart';
import 'package:first_project_1/theme/colors.dart';
import 'package:first_project_1/views/screens/add_post.dart';
import 'package:first_project_1/views/screens/home_screen.dart';
import 'package:first_project_1/views/screens/profile_screen.dart';
import 'package:first_project_1/views/screens/saved_screen.dart';
import 'package:first_project_1/views/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  update() {
    setState(() {});
  }

  int activeIndex = 0;

   changeActiveIndex (int x){
     activeIndex=  x;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavi(),
      floatingActionButton: floatButton(),
      body: getBody(),
    );
  }
  Widget bottomNavi() {
    return Container(
      // color: Colors.grey.withOpacity(.15),
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(
          spreadRadius: 1,
          color: Colors.grey.withOpacity(.4),
          blurRadius: 15,
          // offset: Offset(0,1)
          // spreadRadius: 15,
        )
      ]),

      // color: red,
      height: 80,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                activeIndex = 0;
                setState(() {});
              },
              child: Icon(
                FeatherIcons.home,
                color: activeIndex == 0 ? primary : black,
              )),
          GestureDetector(
            onTap: () {
              activeIndex = 1;
              setState(() {});
            },
            child: Icon(
              FeatherIcons.messageSquare,
              color: activeIndex == 1 ? primary : black,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
              onTap: () {
                activeIndex = 3;
                setState(() {});
              },
              child: Icon(
                FeatherIcons.heart,
                color: activeIndex == 3 ? primary : black,
              )),
          GestureDetector(
            onTap: () {
              activeIndex = 4;
              setState(() {});
            },
            child: Icon(
              Icons.person,
              color: activeIndex == 4 ? primary : black,
            ),
          ),
        ],
      ),
    );
  }
  Widget floatButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Transform.rotate(
        angle: pi / 4,
        child: FloatingActionButton(
          backgroundColor: black,
          onPressed: () {
            activeIndex = 2;
            setState(() {});
          },
          child: Transform.rotate(
              angle: pi / 4,
              child: Icon(
                Icons.add_circle_outline_outlined,
                color: activeIndex == 2 ? primary : white,
              )),
        ),
      ),
    );
  }
  Widget getBody() {
    return IndexedStack(
      index: activeIndex,
      children: [
        HomeScreen(update),
         MesageScreen(),
        AddPost(changeActiveIndex),
        SavedScreen(update,listPostModels ),
        const ProfileScreen(),
      ],
    );
  }
}
