import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/model/cast.dart';
import 'package:movies_neon_design/features/movie/data/model/movie.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/cast_list.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/description_section.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/title_overview_section.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  final Cast casts;

  const MovieDetails({super.key, required this.movie, required this.casts});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
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
            MovieDescriptionSection(movie: widget.movie),
            //Title setion
            TitleOverviewSection(
              title: widget.movie.title!,
              overview: widget.movie.overview!,
            ),

            //cast section
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'Casts ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            CastList(
              cast: widget.casts,
            ),
          ],
        ),
      ),
    );
  }
}
