import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.myCyan,
      ),
    );
  }
}
