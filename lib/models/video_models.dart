class VideoModel{
  String? img;
  String? videoUrl;

  VideoModel.fromMap(Map<String,dynamic> map){
    img=map["img"];
    videoUrl=map["videoUrl"];
  }
}