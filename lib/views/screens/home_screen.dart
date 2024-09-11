import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/post_json.dart';
import '../../data/user_json.dart';
import '../../models/post_models.dart';
import '../../theme/colors.dart';
import '../widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  Function function;
  HomeScreen(this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "socially",
          style: TextStyle(
              fontSize: 25.sp, letterSpacing: 1.1, fontWeight: FontWeight.bold
          ),
        ),
        actions: const[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              FeatherIcons.bell,
              size: 28,
              color: black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.only(right: 15.w, left: 16.w, top: 15.h),
        child: ListView(

          children: [
            Text(
              "Feed".tr(),
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
             SizedBox(
              height: 15.h,
            ),
            storyRow(),
             SizedBox(
              height: 20.h,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listPostModels.length,
                itemBuilder: (context, index) {
                  return post_widget(index,function,listPostModels[index]);
                }),
          ],
        ),
      ),
    );
  }

  Widget circleOne() {
    return Container(
      height: 70.h,
      width: 70.w,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            Color(0xFFFFE0DF),
            Color(0xFFE1F6f4),
          ])),
      child: const Icon(Icons.add),
    );
  }

  Widget storyRow() {
    return SizedBox(
      height: 100.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            circleOne(),
              SizedBox(
              width: 10.w,
            ),
            ListView.builder(
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listUserModels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 35.r,
                      backgroundImage: NetworkImage(listUserModels[index].img ??
                          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
