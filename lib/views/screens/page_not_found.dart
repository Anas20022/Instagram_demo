import 'package:flutter/material.dart';
class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("PageNotFound",style: TextStyle(fontSize: 28,color: Colors.white),),
      ),
    );
  }
}
