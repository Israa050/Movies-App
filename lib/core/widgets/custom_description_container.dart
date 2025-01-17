import 'package:flutter/material.dart';

class CustomDescriptionContainer extends StatelessWidget {
  final String content;
  double? height;
  double? width;
  EdgeInsetsGeometry? margin;
  Color? fontColor;
  CustomDescriptionContainer({super.key, required this.content,this.height,this.width,required this.margin, this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      //EdgeInsets.only(right:margin),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff312F35),
      ),
      child: Center(
        child: Text(
          maxLines: 1,
          content,
          style: TextStyle(
            color: fontColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
