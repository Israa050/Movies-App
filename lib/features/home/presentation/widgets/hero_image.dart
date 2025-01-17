import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/model/media.dart';

class HeroImage extends StatelessWidget {
  final Media movie;
  const HeroImage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Hero(
      tag: movie.id!,
      child: Container(
        height: screenHeight * 0.6,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.posterPath!}',
          fit: BoxFit.cover,
          fadeInDuration: const Duration(seconds: 3),
          fadeOutDuration: const Duration(seconds: 5),
        ),
      ),
    );
  }
}
