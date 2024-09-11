import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/post_json.dart';
import '../../models/post_models.dart';
import '../../theme/colors.dart';

class SavedScreen extends StatelessWidget {
  Function function;
  final List<PostModels> postModels;

  SavedScreen(this.function, this.postModels, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Saved".tr(),
          style: TextStyle(
              fontSize: 25.sp, letterSpacing: 1.1, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10.0),
        child: GridView.builder(
            itemCount:
            listPostModels.where((element) => element.isLike).length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,


            ),
            itemBuilder: (context,index){
              final post = listPostModels
                  .where((element) => element.isLike)
                  .toList()[index];
              return Stack(children: [
                Container(
                  width: ((MediaQuery.of(context).size.width - 20) / 2).w,
                  height: ((MediaQuery.of(context).size.width - 20) / 2).h,
                  decoration: BoxDecoration(
                      image:
                      DecorationImage(
                          fit: BoxFit.cover,
                          image: post.file==null?
                          NetworkImage(listPostModels
                              .where((element) => element.isLike)
                              .toList()[index]
                              .postImg ??""):FileImage(post.file!) as ImageProvider

                        // image: NetworkImage(listPostModels
                        //         .where((element) => element.isLike)
                        //         .toList()[index]
                        //         .postImg ??
                        //     "")
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                            blurStyle: BlurStyle.inner,
                            blurRadius: 15,
                            spreadRadius: 6,
                            color: grey.withOpacity(.4),
                            offset: const Offset(0, 1))
                      ]),
                ),
                Container(
                  width: ((MediaQuery.of(context).size.width - 20) / 2).w,
                  height: ((MediaQuery.of(context).size.width - 20) / 2).h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        color: black.withOpacity(.35),
                        // spreadRadius: 1,
                        // blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {

                              listPostModels.where((element) => element.isLike).toList()[index].isLike=!listPostModels.where((element) => element.isLike).toList()[index].isLike;
                              // Call the function passed from the parent widget to update UI
                              function();

                            },
                            child: const Icon(
                              Icons.favorite,
                              color: red,
                            ))),
                  ),
                )
              ]);
            }),
      ),
    );
  }
}
