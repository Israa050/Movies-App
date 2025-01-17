import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/routes/routes.dart';
import 'package:movies_neon_design/features/home/data/repository/movies_repository.dart';
import 'package:movies_neon_design/features/home/logic/cubit/movies_cubit.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/curved_bottom_navigation.dart';
import 'package:movies_neon_design/features/movie/logic/cubit/movie_details_cubit.dart';
import 'package:movies_neon_design/features/movie/presentation/screens/details_page.dart';
import 'package:movies_neon_design/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:movies_neon_design/features/trailer/logic/cubit/trailer_cubit.dart';
import 'package:movies_neon_design/features/trailer/presentation/screens/movie_trailer.dart';
import 'package:movies_neon_design/features/tv/logic/cubit/tv_cubit.dart';
import 'package:movies_neon_design/features/tv/presentation/screens/tv_details_screen.dart';
import 'package:movies_neon_design/injection/injection.dart';

class AppRouter {
  // late MoviesRepository moviesRepository;
  // late MoviesCubit moviesCubit;

  // AppRouter() {
  //   moviesRepository =
  //   MoviesRepository(WebServices(WebServices.createAndSetupDio()));
  //   moviesCubit = MoviesCubit(moviesRepository: moviesRepository);
  // }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.home:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext contxt) => getIt<MoviesCubit>(),
              child: const CustomCurvedBottomNavigation(),
            ),
          );
        }
      case Routes.details:
        {
          final movie = settings.arguments as Media;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext contxt) =>
                  MovieDetailsCubit(moviesRepository: MoviesRepository(getIt())),
              child: DetailsPage(
                movie: movie,
              ),
            ),
          );
        }

      case Routes.details2:
        {
          final tv = settings.arguments as Media;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext contxt) =>
              TvCubit(moviesRepository: MoviesRepository(getIt())),
              child: TVDetailsScreen(
                tv: tv,
              ),
            ),
          );
        }

      case Routes.trailer:
        {
          final media = settings.arguments as Media;
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) =>
                    //getIt<TrailerCubit>(),
                    TrailerCubit(moviesRepository: MoviesRepository(getIt())),
                    child: MovieTrailersScreen(
                      media: media,
                    ),
                  ));
        }
    }

    return null;
  }
}
