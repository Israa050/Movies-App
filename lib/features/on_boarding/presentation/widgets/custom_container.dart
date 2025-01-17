
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCirculerContainer extends StatelessWidget {
  final Color blurColor;
  final double height;
  final double width;

  const CustomCirculerContainer({super.key, required this.blurColor, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: blurColor,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
              child:  SizedBox(
                height:height ,
                width:width,
              ),
            ),
          );
  }
}