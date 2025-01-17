
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GlassmorphicContainer(
        width: screenWidth,
        height: 92,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.myPink,
            AppColors.myGreen,
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    )),
              ),
              const Expanded(
                child: Text(''),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.category,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      );
  }
}