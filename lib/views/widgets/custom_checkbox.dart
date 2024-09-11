import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class CustumCheckBox extends FormField<bool> {
  // bool checkBox = false;
  FormFieldValidator<bool>? validator ;
  // CustumCheckBox({required super.builder});
  CustumCheckBox({this.validator})
      : super(initialValue: false,validator: validator, builder: (state) {
          return CheckboxListTile(

              activeColor: primary,
              title: Text("Accept all conditions"),
              subtitle:state.hasError?Text(state.errorText??"",style: TextStyle(color: red),):null ,
              value: state.value,
              onChanged: (value) {
                // state.value != !state.value!;
                state.didChange(value);
              });
        });
}

