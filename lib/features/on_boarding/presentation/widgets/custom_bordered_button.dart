import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/core/utils/app_strings.dart';
import 'package:movies_neon_design/core/widgets/custom_outline.dart';

class CustomBorderedButton extends StatelessWidget {

  double radius;

  double strokeWidth;

  double height;

  double width;

  TextStyle textStyle;
  final String title;
  void Function()? onTap;

  CustomBorderedButton({
    super.key,
    this.height = 38,
    this.width = 160,
    this.radius = 20,
    this.strokeWidth = 3,
    required this.textStyle,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
   // final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: CustomOutline(
        strokeWidth: strokeWidth,
        radius: radius,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.myPink,
            AppColors.myGreen,
          ],
        ),
        width: width,
        height: height,
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.myPink.withOpacity(0.5),
                AppColors.myGreen.withOpacity(0.5),
              ],
            ),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
