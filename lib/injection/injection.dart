
import 'package:get_it/get_it.dart';
import 'package:movies_neon_design/core/network/networking.dart';
import 'package:movies_neon_design/features/home/data/api/web_services.dart';
import 'package:movies_neon_design/features/home/data/repository/movies_repository.dart';
import 'package:movies_neon_design/features/home/logic/cubit/movies_cubit.dart';
import 'package:movies_neon_design/features/movie/data/repository/movie_details_repository.dart';
import 'package:movies_neon_design/features/movie/logic/cubit/movie_details_cubit.dart';
import 'package:movies_neon_design/features/trailer/logic/cubit/trailer_cubit.dart';
import 'package:movies_neon_design/features/tv/logic/cubit/tv_cubit.dart';


final getIt = GetIt.instance;

void initGetIt(){
  getIt.registerLazySingleton<MoviesCubit>(()=>MoviesCubit(moviesRepository: getIt()));
  getIt.registerLazySingleton<MoviesRepository>(()=>MoviesRepository(getIt()));
  getIt.registerLazySingleton<WebServices>(()=>WebServices(WebServices.createAndSetupDio()));
  getIt.registerLazySingleton<MovieDetailsCubit>(()=>MovieDetailsCubit(moviesRepository: getIt()));
  getIt.registerLazySingleton<TrailerCubit>(()=>TrailerCubit(moviesRepository: getIt()));
  getIt.registerLazySingleton<TvCubit>(()=>TvCubit(moviesRepository: getIt()));
 // getIt.registerLazySingleton<MovieDetailsRepository>(()=>MovieDetailsRepository(getIt()));

}


