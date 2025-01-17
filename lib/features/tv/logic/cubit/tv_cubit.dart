import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_neon_design/core/model/cast.dart';
import 'package:movies_neon_design/features/tv/data/model/tv_show.dart';
import 'package:movies_neon_design/features/home/data/repository/movies_repository.dart';

part 'tv_state.dart';

class TvCubit extends Cubit<TvState> {
      final MoviesRepository moviesRepository;

  TvCubit({required this.moviesRepository}) : super(TvInitial());


  void getTvDetails(int id)async{
    emit(Loading());
    try {
      final tv = await moviesRepository.getTVShowById(id);
      print('tv details fetched successfully');
      final casts = await moviesRepository.getTvCasts(id);
      emit(TvLoaded(tvShow: tv,tvCasts: casts));
    } catch (e) {
      emit(TvErrorState(message: 'Cannot Load Data'));
    }

  }


}
