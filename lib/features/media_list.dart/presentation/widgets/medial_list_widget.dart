import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/routes/routes.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';

class MediaListWidget extends StatefulWidget {
  final List<Media> mediaList;
  bool? isMovie;
  bool isLoading = false;
  int? currentPage;
  String? currentTab;
  MediaListWidget(
      {super.key,
      required this.mediaList,
      this.isMovie,
      this.currentTab,
      this.currentPage});

  @override
  State<MediaListWidget> createState() => _MediaListWidgetState();
}

class _MediaListWidgetState extends State<MediaListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(listenToScrollPosition);
    super.initState();
  }

  void listenToScrollPosition() {
    if (_scrollController.offset ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        widget.isLoading = true;
      });
    } else {
      setState(() {
        widget.isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight - 200,
      width: screenWidth,
      child: ListView(
        controller: _scrollController,
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.mediaList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Media media = widget.mediaList[index];
              return GestureDetector(
                onTap: () {
                  if (widget.isMovie == null) {
                    if (media.mediaType == 'movie') {
                      media.mediaType = 'movie';
                      Navigator.pushNamed(context, Routes.details,
                          arguments: media);
                    } else if (media.mediaType == 'tv') {
                      print('Tv show is clicked');
                      media.mediaType = 'tv';
                      Navigator.pushNamed(context, Routes.details2,
                          arguments: media);
                    }
                  } else {
                    if (widget.isMovie!) {
                      media.mediaType = 'movie';
                      Navigator.pushNamed(context, Routes.details,
                          arguments: media);
                    } else {
                      media.mediaType = 'tv';
                      Navigator.pushNamed(context, Routes.details2,
                          arguments: media);
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Hero(
                    tag: media.id!,
                    child: Container(
                      height: screenHeight * 0.1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500/${widget.mediaList[index].posterPath}',
                          placeholder: (context, url) {
                            return const CircularProgressIndicator(
                              color: AppColors.myPink,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const SizedBox(
                              height: 100,
                              width: 100,
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.grey,
                                size: 50,
                              ),
                            );
                          },
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration(seconds: 3),
                          fadeOutDuration: const Duration(seconds: 5),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          widget.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                )
        ],
      ),
    );
  }
}
