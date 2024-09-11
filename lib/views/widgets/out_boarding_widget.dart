import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class OutBoardingWidget extends StatelessWidget {
  String imgUrl;
  String address;
  String discreption;
  OutBoardingWidget({required this.imgUrl,required this.address,required this.discreption});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width/6,
            ),
            Image.asset(imgUrl,height: MediaQuery.of(context).size.height/3,),
            SizedBox(
              height: 100,
            ),
            Text(
              address,
              style: TextStyle(
                  color: primary,
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/1.4,
              child: Text(
                discreption,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(
                      0xff9D9EA3,
                    ),
                    fontSize: 14),
              ),
            ),
          ],
        ));
  }
}