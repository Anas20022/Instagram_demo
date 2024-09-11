import 'dart:convert';

import 'package:first_project_1/data/video_json.dart';
import 'package:first_project_1/models/sp_signIn.dart';
import 'package:first_project_1/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool activeIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: AppBar(
          actions: [
            PopupMenuButton(
              offset: Offset(-20,20),
                color: primary,
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                iconSize: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: TextButton(
                          onPressed: () {
                           print(SpHelperSignIn.spHelper.sharedPreferences!.getString("user")) ;
                           print(json.decode(SpHelperSignIn.spHelper.sharedPreferences!.getString("user")??"")) ;
                          },
                          child: Text(
                            "Setting",
                            style: TextStyle(color: white, fontSize: 17),
                          )),
                    ),

                    PopupMenuItem(
                      child: TextButton(
                          onPressed: () {
                            SpHelperSignIn.spHelper.sharedPreferences!.remove("user");
                            Navigator.pushReplacementNamed(context, "/login_screen");
                          },
                          child: Text(
                            "Sign out",
                            style: TextStyle(color: white, fontSize: 17),
                          )),
                    ),
                  ];
                }),
          ],
          backgroundColor: primaryLight,
          flexibleSpace: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 75.w,
                height: 75.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: black),
                ),
                child: Center(
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fHw%3D"),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Sara Done",
                style: TextStyle(fontSize: 22.sp),
              ),
              Text("@jonhdoe",
                  style:
                      TextStyle(fontSize: 15.sp, color: grey.withOpacity(.8))),
            ]),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Post", style: TextStyle(fontSize: 18.sp)),
                  Text("35",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Followers", style: TextStyle(fontSize: 18.sp)),
                  Text("1,552",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Follows", style: TextStyle(fontSize: 18.sp)),
                  Text(
                    "128",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      activeIcon = true;
                      setState(() {});
                    },
                    child: Icon(Icons.photo_outlined,
                        size: 28, color: activeIcon ? primary : black)),
                InkWell(
                    onTap: () {
                      activeIcon = false;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.smart_display_outlined,
                      size: 28,
                      color: !activeIcon ? primary : black,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: listVideoModels.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(activeIcon
                                  ? mePostList[index] ?? ""
                                  : listVideoModels[index].img ?? ""),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 5,
                                offset: const Offset(0, 1),
                                color: grey.withOpacity(.3))
                          ]),
                    );
                  }),
            ),
          )

          // activeIcon?

          // :Image.network(""),
        ],
      ),
    );
  }
}
