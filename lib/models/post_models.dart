

import 'dart:io';

class PostModels{

  String? name;
  String? img;
  String? postImg;
  String? time;
  String? like;
  String? comment;
  String? share;
  bool isLike=false;
  File? file;

  PostModels({required this.file,required this.name,required this.img,this.share="00",this.comment="00",this.isLike=false,this.like="00",this.time="00:00"});
  PostModels.fromMap(Map<String,dynamic> map){
    name=map["name"];
    img=map["img"];
    postImg=map["postImg"];
    time=map["time"];
    like=map["like"];
    comment=map["comment"];
    share=map["share"];
    isLike=false;

  }
}