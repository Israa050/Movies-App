import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/routes/routes.dart';
import 'package:movies_neon_design/core/utils/app_strings.dart';
import 'package:movies_neon_design/core/widgets/space.dart';
import 'package:movies_neon_design/features/home/presentation/screens/home_screen.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/widgets/custom_bordered_button.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/widgets/custom_gradiant_border_image.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/widgets/custom_text.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    return Center(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(screenHight * 0.07),
            const CustomGradiantBorderImage(),
            verticalSpace(
              screenHight * 0.09,
            ),
            CustomText(
              content: AppStrings.watchMovies,
              textStyle: TextStyle(
                fontSize: screenHight <= 660 ? 18 : 34,
                fontWeight: FontWeight.w700,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            verticalSpace(
              screenHight * 0.05,
            ),
            CustomText(
              content: AppStrings.downloadAndWatch,
              textStyle: TextStyle(
                fontSize: screenHight <= 660 ? 12 : 16,
                fontWeight: FontWeight.w100,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
            verticalSpace(
              screenHight * 0.03,
            ),
            CustomBorderedButton(
              title: AppStrings.signup,
              textStyle: TextStyle(
                fontSize: screenHight <= 660 ? 11 : 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context,Routes.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
