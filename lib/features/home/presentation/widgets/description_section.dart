import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/functions/get_runtime_string.dart';
import 'package:movies_neon_design/core/widgets/custom_description_container.dart';
import 'package:movies_neon_design/features/movie/data/model/movie.dart';

class MovieDescriptionSection extends StatelessWidget {
  final Movie movie;
  const MovieDescriptionSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CustomDescriptionContainer(
            content: getRunTimeString(movie.runtime ?? 0),
            height: 35,
            width: 100,
            margin: const EdgeInsets.only(
              right: 10,
            ),
          ),
          CustomDescriptionContainer(
            content: movie.genres![0].name!,
            margin: const EdgeInsets.all(5),
            height: 35,
            width: 95,
          ),
          CustomDescriptionContainer(
            content: '⭐ ${movie.voteAverage?.toStringAsFixed(1)}',
            margin: const EdgeInsets.all(5),
            height: 35,
            width: 80,
            fontColor: Colors.amber,
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            ),
          ),
          const Icon(
            Icons.favorite_border,
            color: Colors.red,
            size: 30,
          )
        ],
      ),
    );
  }
}
