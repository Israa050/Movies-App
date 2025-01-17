
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/routes/routes.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Media media;
  const CustomButton({super.key,required this.media});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.trailer,arguments: media);
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
              color: AppColors.myYellow,
            ),
            child: const Center(
              child: Text(
                'Watch Trailer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
  }
}