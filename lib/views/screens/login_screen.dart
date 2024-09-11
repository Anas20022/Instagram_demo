import 'package:first_project_1/main_screen.dart';
import 'package:first_project_1/models/sp_signIn.dart';
import 'package:first_project_1/views/screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';
import '../../theme/colors.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> globalKey = GlobalKey();

  bool _showPass = false;
  late TextEditingController _emailEditingController;
  late TextEditingController _passEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailEditingController = TextEditingController();
    _passEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUp()));
      };
    // _tapGestureRecognizer.onTap=tapGestureRecognizerMethod;
    // _tapGestureRecognizer = TapGestureRecognizer()..onTap=tapGestureRecognizerMethod;
  }

  void tapGestureRecognizerMethod() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailEditingController.dispose();
    _passEditingController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 25),
        child: Form(
          key: globalKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: GoogleFonts.nunito(
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                Text(
                  "Login to start using app",
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter address";
                    } else if (!value.isEmail) {
                      return "error syntax must be me@example.com";
                    }
                    return null;
                  },
                  controller: _emailEditingController,
                  // expands: true,
                  // minLines: null,
                  // maxLines: null,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.go,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  textCapitalization: TextCapitalization.sentences,
                  textAlignVertical: TextAlignVertical.center,
                  // style: TextStyle(color: Colors.red),
                  // maxLength: 15,
                  // cursorHeight: 15,
                  // buildCounter: (BuildContext context, {
                  //   required int currentLength,
                  //   required int? maxLength,
                  //   required bool isFocused,
                  // }) {
                  //   return Text("$currentLength%$maxLength",style: TextStyle(color: Colors.red,fontSize: 20),) ;
                  // },
                  decoration: InputDecoration(
                    
                    // counterText: " ",
                    // constraints:
                    //     BoxConstraints(maxHeight: _errorText == null ? 60 : 90),
                    // contentPadding: EdgeInsetsDirectional.only(start: 10, end: 10),
                    // errorText: _errorText,
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    hintText: "email@gmail.com",
                    hintStyle: TextStyle(color: Colors.grey),
                    // counter: Text("asdasd"),
                    // counterText: "anas",
                    // counterStyle: TextStyle(color: Colors.red),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    } else if (value.length < 8) {
                      return "must password gretter than 8";
                    }
                    return null;
                  },
                  controller: _passEditingController,
                  minLines: 1,
                  maxLines: 1,
                  expands: false,
                  obscureText: !_showPass,
                  obscuringCharacter: "#",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  // textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPass = !_showPass;
                        });
                      },
                      icon: _showPass == false
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.blue,
                            )
                          : Icon(
                              Icons.visibility,
                              color: Colors.blue,
                            ),
                    ),
                    // errorText: _errorPass,
                    // errorStyle: TextStyle(fontSize: 15),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),

                    // contentPadding: EdgeInsetsDirectional.only(
                    //     bottom: 20, top: 20),
                    // constraints: BoxConstraints(
                    //   maxHeight: _errorPass == null ? 60 : 90,
                    // ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        SpHelperSignIn.spHelper.writeOnSp(
                            email: _emailEditingController.text,
                            pass: _passEditingController.text);

                        showMessenger(context, "login Successfully");
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: primary,
                        minimumSize: Size(double.infinity, 50))),
                SizedBox(height: 15),
                Center(
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have an acount  ",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          children: [
                        TextSpan(
                            recognizer: _tapGestureRecognizer,
                            text: "Create Now!",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.wavy,
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // bool checkData() {
  //   if (_emailEditingController.text.isNotEmpty &&
  //       _passEditingController.text.isNotEmpty) {
  //     updateErrorState();
  //     return true;
  //   }
  //   updateErrorState();
  //   return false;
  // }

  // void updateErrorState() {
  //   setState(() {
  //     _errorText =
  //     _emailEditingController.text.isEmpty ? "Enter email address" : null;
  //     _errorPass =
  //     _passEditingController.text.isEmpty ? "Enter password" : null;
  //   });
  // }

  void showMessenger(BuildContext context, String newtitle) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // Clear any existing SnackBars
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(
              newtitle,
              style: TextStyle(
                color: Color(0xFFF0EEED),
              ),
            ),
            duration: const Duration(seconds: 3),
            dismissDirection: DismissDirection.endToStart,

            //    dismissDirection: DismissDirection.horizontal,
            backgroundColor: Colors.blue.shade400,
            // onVisible: () => print(
            //   'Visible',
            // ),
            behavior: SnackBarBehavior.floating,
            //    margin: EdgeInsets.symmetric(horizontal: 30),
            //   width: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            action: SnackBarAction(
              label: 'OK',
              onPressed: () => print('Action Pressed'),
              textColor: const Color(0xFFF0EEED),
            ),
          ),
        )
        .closed
        .then((value) => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return MainScreen();
            })));
  }
}
