import 'package:country_code_picker/country_code_picker.dart';
import 'package:first_project_1/models/sp_helper.dart';
import 'package:first_project_1/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';

import '../../models/country.dart';
import '../widgets/TextField_widget.dart';
import '../widgets/custom_checkbox.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Country? selected_country;
  String? selected_city;
  String? codeCuntry;
  late TextEditingController emailController ;
  late TextEditingController firstNameController ;
  late TextEditingController lastNameController ;
  late TextEditingController passwordController ;
  late TextEditingController dateController;
  late TextEditingController numberController ;
  late TextEditingController countryController ;
  late TextEditingController cityController ;
  GlobalKey<FormState> globalKey = GlobalKey();
  // bool checkBox = false;
  bool checkbool = true;
  bool _showPass = false;
  @override
  void initState() {
    super.initState();
    emailController=TextEditingController();
    firstNameController=TextEditingController();
    lastNameController=TextEditingController();
    passwordController=TextEditingController();
    dateController=TextEditingController();
    numberController=TextEditingController();
    countryController=TextEditingController();
    cityController=TextEditingController();
    // TODO: implement initState
  }
  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    dateController.dispose();
    numberController.dispose();
    countryController.dispose();
    cityController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff9D9EA3),
            ),
          ),
          title: Text(
            "Sign Up",
            style: GoogleFonts.nunito(
                textStyle:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Form(
            key: globalKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email address",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2c2c2c))),
                    ),
                    TextFieldWidget(
                        controller: emailController,
                        hintText: "Enter email",
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter email";
                          } else if (!value.isEmail) {
                            return "error syntax must be me@example.com";
                          }
                          return null;
                        }),
                    Text(
                      "First name",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2c2c2c))),
                    ),
                    TextFieldWidget(
                      controller: firstNameController,
                      hintText: "Enter first name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter first name";
                        } else if (value.length < 3) {
                          return "name must be larger than 3 letters";
                        }
                        return null;
                      },
                    ),
                    Text(
                      "Last name",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2c2c2c))),
                    ),
                    TextFieldWidget(
                      controller: lastNameController,
                      hintText: "Enter last name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter last name";
                        } else if (value.length < 3) {
                          return "name must be larger than 3 letters";
                        }
                        return null;
                      },
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2c2c2c))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          } else if (value.length < 8) {
                            return "must be greeter than 8 char";
                          }
                          return null;
                        },
                        obscureText: !_showPass,
                        obscuringCharacter: "#",
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
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
                          hintText: "Enter password",
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
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Text(
                      "Must be 8 or more characters",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff9D9EA3))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Date of birth",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2c2c2c))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () {
                        selectDate();
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        hintText: "enter date",
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
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "You need to be 16 or over to use App",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff9D9EA3))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                        controller: numberController,
                        suffixIcon: CountryCodePicker(
                          initialSelection: "ps",
                          // favorite: ['+39', 'FR'],
                          // showCountryOnly: false,
                          // showOnlyCountryWhenClosed: false,
                          // alignLeft: false,
                          onChanged: (v) {
                            codeCuntry=v.dialCode ;
                            // print("CountryCode is : ${v.dialCode}");
                          },
                        ),
                        keyboardType: TextInputType.number,
                        hintText: "Enter phone number",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter phone number";
                          } else if (value.length <= 8 || value.length >= 11) {
                            return "must phone number 9 or 10 litters";
                          }
                          return null;
                        }),
                    Text(
                      "Gender",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2c2c2c))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      width: double.infinity,
                      height: 60,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            blurRadius: 10,
                            offset: Offset(0, 1),
                            spreadRadius: 2)
                      ]),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 60,
                            ),
                            InkWell(
                              onTap: () {
                                checkbool = true;
                                setState(() {});
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: checkbool ? primary : Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Male",
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            InkWell(
                              onTap: () {
                                checkbool = false;
                                setState(() {});
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: checkbool ? Colors.grey : primary,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Female",
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Country",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2c2c2c))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                      child: DropdownButton<Country>(
                        underline: SizedBox(),
                        value: selected_country,
                        onChanged: (Country? value) {
                          selected_country = value;
                          selected_city = null;
                          setState(() {});
                        },
                        hint: Text("select Country"),
                        isExpanded: true,
                        items: list_city.map((e) {
                          return DropdownMenuItem<Country>(
                            child: Text(e.name),
                            value: e,
                          );
                        }).toList(),
                        // items: [
                        //   for(int i = 0; i < list_city.length; i++)
                        //     DropdownMenuItem<Country>(value: list_city[i],
                        //       child: Text(list_city[i].name),),
                        // ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "City",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2c2c2c))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        value: selected_city,
                        onChanged: (String? value) {
                          selected_city = value;
                          setState(() {});
                        },
                        hint: Text("select City"),
                        isExpanded: true,

                        items: [
                          if (selected_country != null &&
                              selected_country!.cities.isNotEmpty)
                            for (int i = 0;
                                i < selected_country!.cities.length;
                                i++)
                              DropdownMenuItem<String>(
                                value: selected_country!.cities[i],
                                child: Text(selected_country!.cities[i] ?? ""),
                              ),
                        ],
                        //___________OR using .map_______________
                        // items:
                        // selected_country?.cities.map((e) {
                        //   return DropdownMenuItem<String>(value: e,child: Text(e));}).toList()
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustumCheckBox(validator: (v) {
                      if (!(v!))
                        return "you have to acept our condations first";
                      return null;
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // print(Khader().fun());


                          // if(!checkBox){
                          //   return "must agree to all terms";
                          // }
                          if (globalKey.currentState!.validate()) {
                            SpHelper.spHelper.writeOnSp(
                                email: emailController.text,
                                fname: firstNameController.text,
                                lname: lastNameController.text,
                                pass: passwordController.text,
                                date: dateController.text,
                                num: (codeCuntry)??"970"+numberController.text,
                                gender: checkbool?"Male":"Female",
                                country:
                                    selected_country?.name ?? "not definded",
                                city: selected_city ?? "not definded");
                            showMessenger(context, "SignUp Successfully");
                          }
                        },
                        child: Text("Sign up",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: primary,
                            minimumSize: Size(
                              double.infinity,
                              60,
                            )),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60),
                        backgroundColor: primary,
                      ),
                      onPressed: () {
                        SpHelper.spHelper.readOnSp();
                      },
                      child: Text(
                        "check data",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }

  void selectDate() async {
    DateTime? dateTime = await showDatePicker(
      barrierColor: primary,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (dateTime != null) {
      // Extract the date part and format it as needed
      dateController.text = dateTime.toString().split(" ")[0];
      setState(() {});
    }
  }

  void showMessenger(context, newtitle) {
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
              return LoginScreen();
            })));
  }
}
