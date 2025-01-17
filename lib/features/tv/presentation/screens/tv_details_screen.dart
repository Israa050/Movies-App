

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/custom_button.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/hero_image.dart';
import 'package:movies_neon_design/features/tv/logic/cubit/tv_cubit.dart';
import 'package:movies_neon_design/features/tv/presentation/widgets/tv_details.dart';

class TVDetailsScreen extends StatefulWidget {

  final Media tv;
  const TVDetailsScreen({super.key,required this.tv});

  @override
  State<TVDetailsScreen> createState() => _TVDetailsScreenState();
}

class _TVDetailsScreenState extends State<TVDetailsScreen> {


@override
  void initState() {
    super.initState();
    BlocProvider.of<TvCubit>(context).getTvDetails(widget.tv.id!);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.myBackgroundColor,
      body: ListView(
        children: [
        HeroImage(movie: widget.tv),
          BlocBuilder<TvCubit, TvState>(
          builder: (context, state) {
          if (state is TvLoaded) {
            return TvDetailsBody(tvShow: state.tvShow,casts: state.tvCasts,);
            // return MovieDetails(
            //   movie: state.movie,
            //   casts: state.casts,
            // );
          } else if (state is TvErrorState) {
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
      bottomNavigationBar: CustomButton(media: widget.tv,),
    );
  }
}