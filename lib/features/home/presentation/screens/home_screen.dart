import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/core/utils/app_strings.dart';
import 'package:movies_neon_design/core/widgets/space.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/custom_bottom_navigation.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/custom_floating_action_button.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/movies_bloc_builder.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/search_field_widget.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/widgets/custom_container.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.myBackgroundColor,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: CustomCirculerContainer(
                blurColor: AppColors.myGreen.withOpacity(0.5),
                height: 200,
                width: 200,
              ),
            ),
            Positioned(
              top: screenHeight * 0.4,
              right: -88,
              child: CustomCirculerContainer(
                blurColor: AppColors.myPink.withOpacity(0.5),
                height: 166,
                width: 166,
              ),
            ),
            Positioned(
              bottom: -100,
              left: -100,
              child: CustomCirculerContainer(
                blurColor: AppColors.myCyan.withOpacity(0.5),
                height: 200,
                width: 200,
              ),
            ),
            
            SafeArea(
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  verticalSpace(24),
                  const CustomText(
                    content: AppStrings.whatToWatch,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  verticalSpace(30),
                   SearchFieldWidget(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                  verticalSpace(39),
                 const MoviesBlocBuilder(),
                  verticalSpace(10),

                //  _buildCarouselSliderIndicator(),

                  //  verticalSpace(38),

                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:const CustomBottomNavigation()
    );
  }
}
