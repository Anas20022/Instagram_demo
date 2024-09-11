import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpHelperSignIn {

  SpHelperSignIn._();
  static SpHelperSignIn spHelper = SpHelperSignIn._();

  SharedPreferences? sharedPreferences;

  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  writeOnSp({
    required String email,
    required String pass,
  }) {
    if (sharedPreferences == null) {
      print("SharedPreferences not initialized");
      return;
    }
    Map<String, dynamic> map = {
      "email": email,
      "pass": pass,
    };
    String? userdata = json.encode(map);
    sharedPreferences!.setString("user", userdata);
  }
  deletOnSp()async{
    await sharedPreferences!.remove("user");
  }
}
