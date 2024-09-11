import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {

  SpHelper._();
  static SpHelper spHelper = SpHelper._();

  SharedPreferences? sharedPreferences;



  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  writeOnSp(
      {required String email,
      required String fname,
      required String lname,
      required String pass,
      required String date,
      required String num,
      required String gender,
      required String country,
      required String city}) {
    if (sharedPreferences == null) {
      print("SharedPreferences not initialized");
      return;
    }
    Map<String, dynamic> map = {
      "email": email,
      "fname": fname,
      "lname": lname,
      "pass": pass,
      "date": date,
      "num": num,
      "gender": gender,
      "country": country,
      "city": city,
    };
    String? userdata = json.encode(map);
    sharedPreferences!.setString("user", userdata);
    // sharedPreferences!.setString("name", email);
    // sharedPreferences!.setString("name", email);
    // sharedPreferences!.setString("name", email);
  }
  readOnSp(){
    if(sharedPreferences==null){
           print("this is firts time please register");

    }
    else {
      print("Home Page");
    }
  }

  // readOnSp() {
  //   if (sharedPreferences == null) {
  //     print("SharedPreferences not initialized");
  //     return;
  //   }
  //   String? user = sharedPreferences!.getString("user");
  //   if (user == null) {
  //     print("this is first time please signUp first");
  //   } else {
  //     Map<String, dynamic> map = json.decode(user);
  //     print(map);
  //     // print(map.runtimeType);
  //   }
  // }
}
