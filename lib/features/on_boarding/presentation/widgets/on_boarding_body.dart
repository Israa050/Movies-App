
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/widgets/custom_column.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/widgets/custom_container.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      height: screenHight,
      child: Stack(
        children: [
          Positioned(
            top: screenHight * 0.1,
            left: -88,
            child: const CustomCirculerContainer(
              blurColor: AppColors.myPink,
              height: 166,
              width: 166,
            ),
          ),
          Positioned(
            top: screenHight * 0.3,
            right: -100,
            child: const CustomCirculerContainer(
              blurColor: AppColors.myGreen,
              height: 200,
              width: 200,
            ),
          ),
         const CustomColumn(),
        ],
      ),
    );
  }
}
