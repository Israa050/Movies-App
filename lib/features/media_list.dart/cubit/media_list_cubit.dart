import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/features/home/data/repository/movies_repository.dart';

part 'media_list_state.dart';

class MediaListCubit extends Cubit<MediaListState> {

  final MoviesRepository moviesRepository;

  MediaListCubit({required this.moviesRepository}) : super(MediaListInitial());

  List<Media> _popularMovies = [];
  List<Media> _nowPlayingMovies = [];
  List<Media> _topRatedMovies= [];


  Future<List<Media>?> fetchMediaList(String category)async{
     if (category == 'popular' && _popularMovies.isNotEmpty) {
      // If data for popular movies is already fetched, return cached data
      emit(MediaListLoadedtwo(media: _popularMovies));
      return null;
    }

    if (category == 'trending' && _nowPlayingMovies.isNotEmpty) {
      // If data for trending movies is already fetched, return cached data
      emit(MediaListLoadedtwo(media: _nowPlayingMovies));
      return null;
    }

    if (category == 'top-rated' && _topRatedMovies.isNotEmpty) {
      // If data for top-rated movies is already fetched, return cached data
      emit(MediaListLoadedtwo(media: _topRatedMovies));
      return null;
    }

    emit(Loading());
      try {
       List<Media> movies = [];
      if (category == 'popular') {
        movies = (await moviesRepository.getNowPlayingMovies())!;
        _popularMovies = movies;
      } else if (category == 'trending') {
        //_trendingMovies = movies;
      } else {
        //_topRatedMovies = movies;
      }
      emit(MediaListLoadedtwo(media: movies));
      return movies;
    } catch (e) {
      emit(ErrorState( message: 'Failed to load movies'));
      return null;
    }
  }

}
