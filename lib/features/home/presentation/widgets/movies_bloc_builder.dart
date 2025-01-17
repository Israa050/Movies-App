import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_neon_design/features/home/logic/cubit/movies_cubit.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/movies_error_view.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/carousel_list.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/shimmer_loading_shape.dart';

class MoviesBlocBuilder extends StatefulWidget {
  const MoviesBlocBuilder({super.key});

  @override
  State<MoviesBlocBuilder> createState() => _MoviesBlocBuilderState();
}

class _MoviesBlocBuilderState extends State<MoviesBlocBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesCubit>(context).getNowPlayingMovies();
   // BlocProvider.of<MoviesCubit>(context).getMoviesCasts(1184918);
   // BlocProvider.of<MoviesCubit>(context).getMovieById(1184918);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
     if (state is MoviesLoaded) {
        return MoviesCarouselSlider(movies: state.movies);
      } else if (state is MoviesError) {
        return MoviesErrorView(message: state.message);
      } else {
        return const CarouselListLoading();
     }
    });
  }
}
