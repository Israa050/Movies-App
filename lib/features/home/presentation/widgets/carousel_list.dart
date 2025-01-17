import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/routes/routes.dart';

class MoviesCarouselSlider extends StatefulWidget {
  final List<Media> movies;

   const MoviesCarouselSlider({super.key, required this.movies});

  @override
  State<MoviesCarouselSlider> createState() => _MoviesCarouselSliderState();
}

class _MoviesCarouselSliderState extends State<MoviesCarouselSlider> {
  String placeholder = 'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=';

   String image = 'https://image.tmdb.org/t/p/w500/';

   bool flag = false;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enlargeCenterPage: true,
      ),
      items: widget.movies.map((movie) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: (){
                if(movie.mediaType == 'movie'){
                   Navigator.pushNamed(context, Routes.details,arguments: movie);
                }else if(movie.mediaType == 'tv'){
                   Navigator.pushNamed(context, Routes.details2,arguments: movie);
                }
              },
              child: Hero(
                tag: movie.id!,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    //color: Colors.amber,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        errorListener: (p){
                           setState(() {
                              flag = true;
                           });
                        },
                        //placeholder,
                       // flag? placeholder :
                        '$image${movie.posterPath}',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
