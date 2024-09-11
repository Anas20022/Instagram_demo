import 'package:flutter/material.dart';

class AnyThink extends StatelessWidget {
  const AnyThink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 132/214,

                crossAxisCount: 2,
                mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
