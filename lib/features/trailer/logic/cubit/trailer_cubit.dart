import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_neon_design/features/home/data/repository/movies_repository.dart';
import 'package:movies_neon_design/features/movie/logic/cubit/movie_details_cubit.dart';
import 'package:movies_neon_design/features/trailer/data/model/trailer.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  final MoviesRepository moviesRepository;

  TrailerCubit({required this.moviesRepository}) : super(TrailerInitial());


  void getMovieTrailers(int id)async{
    emit(TrailerLoading());
    try {
      Trailer trailers = await moviesRepository.getMovieTrailers(id);
      print('trailers fetched successfully');
      emit(TrailersLoaded(trailers: trailers));
    } catch (e) {
      emit(TrailerError(message: 'Error Happened while fetching trailers'));
    }
  }

  void getTvTrailers(int id)async{
    emit(TrailerLoading());
    try {
      Trailer trailers = await moviesRepository.getTvTrailers(id);
      print('TV trailers fetched successfully');
      emit(TrailersLoaded(trailers: trailers));
    } catch (e) {
      emit(TrailerError(message: 'Error Happened while fetching trailers'));
    }
  }


}
