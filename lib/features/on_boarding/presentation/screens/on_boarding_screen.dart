
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/widgets/on_boarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.myBackgroundColor,
      extendBody: true,
      body: OnBoardingBody(),
    );
  }
}
