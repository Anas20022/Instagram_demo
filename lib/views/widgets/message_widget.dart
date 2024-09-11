import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../data/user_json.dart';
import '../../theme/colors.dart';

class MessageWidget extends StatelessWidget {
  int index;
  MessageWidget(this.index, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 15.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(.2),
                  offset: const Offset(0,1),
                  spreadRadius: 2,
                  blurRadius: 20,
                blurStyle: BlurStyle.outer
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5,color: black,)
                ),
                child: Center(
                  child:Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(listUserModels[index].img??"na img")
                      )
                    ),

                  ) ,
                ),
              ),
              const SizedBox(width: 20,),
               SizedBox(
                width: MediaQuery.of(context).size.width *0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(listUserModels[index].name??"na name",style: const TextStyle(fontSize: 20),),
                    Text(listUserModels[index].message??"na message",maxLines: 1,overflow:TextOverflow.ellipsis ,style: TextStyle(fontSize: 15,color: grey.withOpacity(.6),)),
                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
