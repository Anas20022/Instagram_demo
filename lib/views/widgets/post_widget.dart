import 'package:flutter/material.dart';

import '../../data/post_json.dart';
import '../../models/post_models.dart';
import '../../theme/colors.dart';

class post_widget extends StatelessWidget {
  int index;
  Function function;
  PostModels postModels;

  post_widget(this.index, this.function,this.postModels ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: postModels.file == null
                      ? NetworkImage(listPostModels[index].postImg!)
                      : FileImage(postModels.file!) as ImageProvider),

              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 15,
                    color: grey.withOpacity(.6),
                    offset: const Offset(0, 1)),
              ]),
          height: 280,
          width: double.infinity,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: black.withOpacity(.5)),
          height: 280,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(listPostModels[index].img ?? ""),
                      radius: 23,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listPostModels[index].name ?? "",
                          style: const TextStyle(color: white, fontSize: 16),
                        ),
                        Text(listPostModels[index].time ?? "",
                            style: const TextStyle(color: white, fontSize: 12)),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.more_vert,
                      color: white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 30,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: () {
                                listPostModels[index].isLike =
                                    !listPostModels[index].isLike;
                                function();
                              },
                              child: Icon(
                                listPostModels[index].isLike
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color:
                                    listPostModels[index].isLike ? red : white,
                              )),
                          Text(
                            listPostModels[index].like ?? "",
                            style: const TextStyle(color: white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.messenger_outline,
                            color: white,
                            size: 20,
                          ),
                          Text(
                            listPostModels[index].comment ?? "",
                            style: const TextStyle(color: white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.share,
                            color: white,
                            size: 18,
                          ),
                          Text(
                            listPostModels[index].share ?? "",
                            style: const TextStyle(color: white),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
