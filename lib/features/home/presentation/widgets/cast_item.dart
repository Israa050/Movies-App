import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/model/cast.dart';
import 'package:movies_neon_design/core/widgets/space.dart';

class MyCast extends StatelessWidget {
  final ClsCast cast;
  const MyCast({super.key,required this.cast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: 108,
            width: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blueGrey,
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  'https://image.tmdb.org/t/p/w500/${cast.profilePath}',
                  //'https://media.themoviedb.org/t/p/w500/ui8e4sgZAwMPi3hzEO53jyBJF9B.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          verticalSpace(8),
           Text(
            '${cast.name}',
            //'Willem Dafoe',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
