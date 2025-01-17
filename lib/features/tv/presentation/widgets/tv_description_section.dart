
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/widgets/custom_description_container.dart';
import 'package:movies_neon_design/features/tv/data/model/tv_show.dart';

class TvDescriptionSection extends StatelessWidget {
  TvShow tvShow;
  TvDescriptionSection({super.key,required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CustomDescriptionContainer(
            content: '${tvShow.numberOfSeasons}',
            height: 35,
            width: 100,
            margin: const EdgeInsets.only(
              right: 10,
            ),
          ),
          CustomDescriptionContainer(
            content: tvShow.numberOfEpisodes.toString(),
            margin: const EdgeInsets.all(5),
            height: 35,
            width: 95,
          ),
          CustomDescriptionContainer(
            content: '⭐ ${tvShow.voteAverage?.toStringAsFixed(1)}',
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