import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/core/widgets/grid_view_loading.dart';
import 'package:movies_neon_design/core/widgets/space.dart';
import 'package:movies_neon_design/features/home/logic/cubit/movies_cubit.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/search_field_widget.dart';
import 'package:movies_neon_design/features/media_list.dart/presentation/widgets/medial_list_widget.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/widgets/custom_container.dart';

class SearchScreen extends StatelessWidget {


  SearchScreen({super.key});

Widget buildlistScreen() {
  return BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
    if (state is SearchedListLoaded) {
      return MediaListWidget(mediaList: state.media);
    } else if (state is MoviesError) {
      return Center(
        child: SizedBox(
          height: 800,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (state is MoviesLoading) {
      return const GridViewLoading();
    }
    return const SizedBox();
  });
}

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(
            top: -100,
            left: -100,
            child: CustomCirculerContainer(
              blurColor: AppColors.myGreen.withOpacity(0.5),
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            top: screenHeight * 0.4,
            right: -88,
            child: CustomCirculerContainer(
              blurColor: AppColors.myPink.withOpacity(0.5),
              height: 166,
              width: 166,
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: CustomCirculerContainer(
              blurColor: AppColors.myCyan.withOpacity(0.5),
              height: 200,
              width: 200,
            ),
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              primary: true,
              children: [
                verticalSpace(24),

                //verticalSpace(30),
                SearchFieldWidget(
                  padding:const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),

                verticalSpace(30),

                buildlistScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

