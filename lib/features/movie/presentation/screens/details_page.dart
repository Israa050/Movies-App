import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/custom_button.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/hero_image.dart';
import 'package:movies_neon_design/features/movie/logic/cubit/movie_details_cubit.dart';
import 'package:movies_neon_design/features/movie/presentation/screens/movie_details_page.dart';

class DetailsPage extends StatefulWidget {
  //final int id;
  final Media movie;
  const DetailsPage({super.key, required this.movie});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieDetailsCubit>(context).getMovieById(widget.movie.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackgroundColor,
      body: ListView(
        children: [
          HeroImage(movie: widget.movie),
          

          BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
          if (state is MovieDetailsLoaded) {
            return MovieDetails(
              movie: state.movie,
              casts: state.casts,
            );
          } else if (state is ErrorState) {
            return Container(
              height: 100,
              width: 100,
              color: Colors.amber,
              child: Text('Error ${state.message}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),


        ],
      ),
      bottomNavigationBar: CustomButton(media: widget.movie,),
    );
  }
}
