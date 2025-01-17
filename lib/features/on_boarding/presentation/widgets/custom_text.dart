import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String content;
  final TextStyle textStyle;

  const CustomText({super.key, required this.content, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.center,
      style: textStyle,
    );
  }
}
