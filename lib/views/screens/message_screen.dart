import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/user_json.dart';
import '../../theme/colors.dart';
import '../widgets/message_widget.dart';

class MesageScreen extends StatelessWidget {

   MesageScreen({super.key});

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "MessagesAppBar".tr(),
          style: TextStyle(
              fontSize: 25.sp, letterSpacing: 1.2, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 20.h),
        child: ListView(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 5.0.h,left: 3.w,right: 3.w),
              child: Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(.2),
                        offset: const Offset(0,1),
                        spreadRadius: 2,
                        blurRadius: 20,
                        blurStyle: BlurStyle.outer
                    ),
                  ],

                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 15.w,),
                    Icon(Icons.search,size: 30.sp,),
                    SizedBox(width: 18.w,),
                    Expanded(
                      child: TextField(
                        onChanged: (v){
                           print(v);
                        },
                        // cursorColor: black,
                        decoration: InputDecoration(

                          border: InputBorder.none,
                          hintText: "MessagesTextField".tr(),

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
             SizedBox(height: 40.h,),
            ListView.builder(
              shrinkWrap: true,
                physics:const  NeverScrollableScrollPhysics(),
                itemCount: usersList.length,
                itemBuilder: (context,index){
                  return MessageWidget(index);
                }),


          ],
        ),
      ),
    );
  }
}

