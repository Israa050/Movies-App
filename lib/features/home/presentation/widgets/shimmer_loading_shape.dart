import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/widgets/shimmer_item.dart';

class CarouselListLoading extends StatelessWidget {
  const CarouselListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enlargeCenterPage: true,
      ),
      items: [1,2,3,4,5].map((intem) {
        return Builder(
          builder: (BuildContext context) {
            return const ShimmerItem();
            
          //   ShimmerContainer(
          //     width: MediaQuery.of(context).size.width,
          //     highlightColor:const Color(0xffF9F9FB),
          //     baseColor: const Color(0xffE6E8EB),
          //     radius: 20,
          //     millisecondsDelay: 0,
          //     height: 0,
          //       //color: Colors.amber,
          // );
          },
        );
      }).toList(),
    );
  }
}

