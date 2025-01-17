import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_neon_design/core/model/cast.dart';
import 'package:movies_neon_design/features/home/data/repository/movies_repository.dart';
import 'package:movies_neon_design/features/movie/data/model/movie.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
    final MoviesRepository moviesRepository;

  MovieDetailsCubit({required this.moviesRepository}) : super(MovieDetailsInitial());


  void getMovieById(int id)async{
    emit(Loading());
    try {
      final movie = await moviesRepository.getMovieById(id);
      print('Movie details fetched successfully');
      final credits = await moviesRepository.getMoviesCasts(id);
      emit(MovieDetailsLoaded(movie: movie,casts: credits));
      print('Movie credits fetched successfully ${credits.id}');
    } catch (e) {
      emit(ErrorState(message: 'Cannot Load Data'));
    }
  }

  void getMoviesCasts(int id){
    emit(Loading());
    moviesRepository.getMoviesCasts(id).then((casts){
      emit(CastsLoaded(casts: casts));
    });
  }

  

}
