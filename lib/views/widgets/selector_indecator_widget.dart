import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class ContainerPageSelectorIndecator extends StatelessWidget {
  bool currentPage;

  ContainerPageSelectorIndecator({
    super.key,
    required this.currentPage,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      height: 5,
      width: 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
          currentPage ? primary : Colors.grey),
    );
  }
}