import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/core/utils/constants.dart';
import 'package:movies_neon_design/features/trailer/data/model/trailer.dart';
import 'package:movies_neon_design/features/trailer/logic/cubit/trailer_cubit.dart';
import 'package:movies_neon_design/features/trailer/presentation/widgets/player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailersScreen extends StatefulWidget {
  final Media media;
  const MovieTrailersScreen({super.key, required this.media});

  @override
  State<MovieTrailersScreen> createState() => _MovieTrailersScreenState();
}

class _MovieTrailersScreenState extends State<MovieTrailersScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.media.mediaType == 'movie') {
      BlocProvider.of<TrailerCubit>(context).getMovieTrailers(widget.media.id!);
    } else if (widget.media.mediaType == 'tv') {
      BlocProvider.of<TrailerCubit>(context).getTvTrailers(widget.media.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.myBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.myGrey,
        title: const Text(
          'Trailers',
        ),
      ),
      body: BlocConsumer<TrailerCubit, TrailerState>(
        listener: (context, state) {
          if (state is TrailerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          //state
          if (state is TrailersLoaded) {
            Trailer trailers = state.trailers;
            List<Video> videos = trailers.results!
                .where((video) =>
                    video.type == 'Trailer' || video.type == 'Teaser')
                .toList();
            return ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                //final trailer = state.trailers.results![index];
                final trailer = videos[index];
                String url = '${Constants.youtubeBaseURL}${trailer.key}';
                var videoId = YoutubePlayer.convertUrlToId(url);
                print(url);
                print("ID:${videoId}");
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 250,
                      //  width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20)),

                      child: InkWell(
                        onTap: () {},
                        child: CachedNetworkImage(
                          imageUrl: YoutubePlayer.getThumbnail(
                            videoId: videoId!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),

                      // child: VideoPlayer(
                      //   videoKey: trailer.key!,
                      // ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
