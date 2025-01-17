import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/core/widgets/custom_outline.dart';

class CustomGradiantBorderImage extends StatelessWidget {
  const CustomGradiantBorderImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CustomOutline(
      strokeWidth: 4,
      radius: screenWidth * 0.8,
      padding: const EdgeInsets.all(4),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.myPink,
          AppColors.myPink.withOpacity(0),
          AppColors.myGreen.withOpacity(0.1),
          AppColors.myGreen,
        ],
        stops: const [0.2, 0.4, 0.6, 1],
      ),
      width: screenWidth * 0.8,
      height: screenWidth * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('assets/images/img-onboarding.png'),
              alignment: Alignment.bottomLeft,
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
