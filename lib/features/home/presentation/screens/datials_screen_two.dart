
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/core/widgets/space.dart';

class DetailsPageTwo extends StatefulWidget {
  final Media tvShow;

  DetailsPageTwo({super.key, required this.tvShow});

  @override
  State<DetailsPageTwo> createState() => _DetailsPageTwoState();
}

class _DetailsPageTwoState extends State<DetailsPageTwo> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.myBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          // height: screenHeight,
          width: screenWidth,
          child: ListView(
            children: [
              Hero(
                tag: widget.tvShow.id!,
                child: Container(
                  height: screenHeight * 0.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                      'https://image.tmdb.org/t/p/w500/${widget.tvShow.posterPath!}',
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(seconds: 3),
                    fadeOutDuration: const Duration(seconds: 5),
                  ),
                ),
              ),

              //   Align(
              //   child: Container(
              //     alignment: Alignment.bottomRight,
              //     // color: Colors.cyan,
              //     // height: 50,
              //     //width: 50,
              //     child: const Text(
              //       '1h 44min',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 16,
              //         fontWeight: FontWeight.w700,
              //       ),
              //     ),
              //   ),
              // ),

              //row items
              // verticalSpace(20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff312F35),
                      ),
                      child: const Center(
                        child: Text(
                          '1h 44min',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 35,
                      width: 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff312F35),
                      ),
                      child: const Center(
                        child: Text(
                          'Action',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff312F35),
                      ),
                      child: Center( 
                        child: Text(
                          '⭐ ${widget.tvShow.voteAverage?.toStringAsFixed(1)}',
                          style:const TextStyle(
                            color: AppColors.myYellow,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
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
              ),

              //Title setion
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      '${widget.tvShow.mediaType}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    AnimatedCrossFade(
                      firstChild: Wrap(
                        children: [
                           Text(
                            overflow: TextOverflow.ellipsis,
                            '${widget.tvShow.overview}',
                           // 'To save Paris from a bloodbath, a grieving scientist is forced to face her tragic past when a giant shark appears in the Seine.',
                            style:const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            maxLines: 3,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                flag = !flag;
                              });
                            },
                            child: const Text(
                              'See more',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      secondChild: Wrap(children: [
                         Text(
                          overflow: TextOverflow.ellipsis,
                          '${widget.tvShow.overview}',
                       //   'To save Paris from a bloodbath, a grieving scientist is forced to face her tragic past when a giant shark appears in the Seine.To save Paris from a bloodbath, a grieving scientist is forced to face her tragic past when a giant shark appears in the Seine.To save Paris from a bloodbath, a grieving scientist is forced to face her tragic past when a giant shark appears in the Seine',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          maxLines: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              flag = !flag;
                            });
                          },
                          child: const Text(
                            'Show less',
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ]),
                      crossFadeState: flag
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 600),
                    ),
                  ],
                ),
              ),

              //cast section
              const Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'Casts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
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
                                image: const DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    'https://media.themoviedb.org/t/p/w500/ui8e4sgZAwMPi3hzEO53jyBJF9B.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            verticalSpace(8),
                            const Text(
                              'Willem Dafoe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
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
