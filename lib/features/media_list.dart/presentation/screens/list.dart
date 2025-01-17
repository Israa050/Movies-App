import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/core/widgets/grid_view_loading.dart';
import 'package:movies_neon_design/features/home/logic/cubit/movies_cubit.dart';
import 'package:movies_neon_design/features/media_list.dart/presentation/widgets/medial_list_widget.dart';

class ListWigets extends StatefulWidget {
  const ListWigets({super.key});

  @override
  State<ListWigets> createState() => _ListWigetsState();
}

class _ListWigetsState extends State<ListWigets>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

   Map<int, String> tabCategories = {
    0: 'popular',
    1: 'now-playing',
    2: 'top-rated',
    3: 'upcoming',
    4: 'on-air',
    5: 'top-rated-shows',
  };

  // Variable to store the current category data
  late String currentCategory;

  @override
  void initState() {
    super.initState();
        currentCategory = tabCategories[0]!;  // Default to the first tab (Popular)
    _controller = TabController(length: 6, vsync: this);
    _controller?.addListener(() {
      if (_controller!.indexIsChanging) {
        print('Current Index is: ${_controller!.index}');
        handleTabs(_controller!.index);
      }else{
        handleTabs(_controller!.index);
      }
    });
    BlocProvider.of<MoviesCubit>(context).fetchMediaList(currentCategory);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void handleTabs(int index) {
   String category = tabCategories[index]!;

    if (category != currentCategory) {
      // Only fetch new data if the selected category is different from the current one
      setState(() {
        currentCategory = category;
      });
      BlocProvider.of<MoviesCubit>(context).fetchMediaList(category);
    }
    // Fetch data for the selected category if it's not cached
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.myBackgroundColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: ClipRRect(
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.cyan,
              ),
              child: Builder(builder: (context) {
                return TabBar(
                  controller: _controller,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicatorColor: AppColors.myPink,
                  tabs: const [
                    Text(
                      'Popular',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Now Playing',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Top Rated',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Upcoming',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'On Air',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Top Rated Shows',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
        title: const Text(
          'Movies List 🎬',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MediaListLoaded) {
            return TabBarView(
              controller: _controller,
              children: [
                MediaListWidget(
                  mediaList: state.movies,
                  isMovie: true,
                  currentTab: tabCategories[0],
                ),
                MediaListWidget(
                  mediaList: state.movies,
                  isMovie: true,
                  currentTab: tabCategories[1],
                ),
                MediaListWidget(
                  mediaList: state.movies,
                  isMovie: true,
                  currentTab: tabCategories[2],
                ),
                MediaListWidget(
                  mediaList: state.movies,
                  isMovie: true,
                  currentTab: tabCategories[3],
                ),
                MediaListWidget(
                  mediaList: state.movies,
                  isMovie: false,
                  currentTab: tabCategories[4],
                ),
                MediaListWidget(
                  mediaList: state.movies,
                  isMovie: false,
                  currentTab: tabCategories[5],
                ),
              ],
            );
          }
          return const GridViewLoading();
        },
      ),
    );
  }
}
