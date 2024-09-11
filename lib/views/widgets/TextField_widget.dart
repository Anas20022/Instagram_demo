import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldWidget extends StatelessWidget {
  String? hintText;
  Widget? suffixIcon ;
  Function validator;
  TextEditingController? controller ;
  TextInputType? keyboardType = TextInputType.emailAddress;

  TextFieldWidget(
      {required this.hintText, this.keyboardType, required this.validator,this.suffixIcon,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        validator: (String? x) {
          return validator(x);
        },
        keyboardType: keyboardType,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(

          suffixIcon:suffixIcon ,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
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
          enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}