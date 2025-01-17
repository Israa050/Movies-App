

import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/model/cast.dart';
import 'package:movies_neon_design/features/tv/data/model/tv_show.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/cast_list.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/title_overview_section.dart';
import 'package:movies_neon_design/features/tv/presentation/widgets/tv_description_section.dart';

// ignore: must_be_immutable
class TvDetailsBody extends StatelessWidget {
  TvShow tvShow;
  Cast casts;
  TvDetailsBody({super.key,required this.tvShow,required this.casts});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: SizedBox(
          // height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // HeroImage(movie: widget.movie),
              TvDescriptionSection(tvShow: tvShow),
              //Title setion
              TitleOverviewSection(title:tvShow.name!,overview: tvShow.overview!,),

              //cast section
                const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'Casts ',
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

               CastList(
                cast: casts,
              ),
            ],
          ),
        ),
      );
  }
}