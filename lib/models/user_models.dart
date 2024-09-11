
class UserModels{

  String? name;
  String? img;
  String? message;

  UserModels.fromMap(Map<String,dynamic> map){
    name=map["name"];
    img=map["img"];
    message=map["message"];

  }
}