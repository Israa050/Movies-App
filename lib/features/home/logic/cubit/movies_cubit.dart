import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_neon_design/core/model/cast.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/features/media_list.dart/cubit/media_list_cubit.dart';
import 'package:movies_neon_design/features/movie/data/model/movie.dart';
import 'package:movies_neon_design/features/home/data/repository/movies_repository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository moviesRepository;
  MoviesCubit({required this.moviesRepository}) : super(MoviesInitial());

  MediaListCubit? cubit;

  List<Media>? mainList;

  void getNowPlayingMovies()async{
    emit(MoviesLoading());
    try {
      mainList ??= (await moviesRepository.getTrendingMovies());
      emit(MoviesLoaded(movies: mainList!));
    } catch (e) {
      emit(MoviesError(message: e.toString()));
    }
  }

  void getMovieById(int id){
    emit(MoviesLoading());
    moviesRepository.getMovieById(id).then((movie){
      emit(MovieLoaded(movie: movie));
    });
  }

  void fetchDate(String category){
    cubit = MediaListCubit(moviesRepository: moviesRepository);
    cubit?.fetchMediaList(category);
  }

  List<Media> _popularMovies = [];
  List<Media> _nowPlayingMovies = [];
  List<Media> _topRatedMovies= [];
  List<Media> _upcomingMovies = [];
  List<Media> _onAir = [];
  List<Media> _topRatedShows = [];


  Future<void> fetchMediaList(String category)async{
     if (category == 'popular' && _popularMovies.isNotEmpty) {
      // If data for popular movies is already fetched, return cached data
      emit(MediaListLoaded(movies: _popularMovies));
      return;
    }

    if (category == 'trending' && _nowPlayingMovies.isNotEmpty) {
      // If data for trending movies is already fetched, return cached data
      emit(MediaListLoaded(movies: _nowPlayingMovies));
      return;
    }

    if (category == 'top-rated' && _topRatedMovies.isNotEmpty) {
      // If data for top-rated movies is already fetched, return cached data
      emit(MediaListLoaded(movies: _topRatedMovies));
      return;
    }

    if(category == 'upcoming' && _upcomingMovies.isNotEmpty){
       emit(MediaListLoaded(movies: _upcomingMovies));
      return;
    }

    if(category == 'on-air' && _upcomingMovies.isNotEmpty){
       emit(MediaListLoaded(movies: _onAir));
      return;
    }

    if(category == 'top-rated-shows' && _upcomingMovies.isNotEmpty){
       emit(MediaListLoaded(movies: _topRatedShows));
      return;
    }

    emit(MoviesLoading());
      try {
      List<Media> movies = [];
      if (category == 'popular') {
        //movies = (await moviesRepository.getPopularMovies());
        final response = (await moviesRepository.getPopularMovies(1));
        movies = response.results!;
        _popularMovies = movies;
      } else if (category == 'now-playing') {
        movies = (await moviesRepository.getNowPlayingMovies())!;
        _nowPlayingMovies = movies;
      } else if(category == 'top-rated') {
        movies = (await moviesRepository.getTopRatedMovies());
        _topRatedMovies = movies;
      }else if(category == 'upcoming'){
        movies = (await moviesRepository.getUpcomingMovies());
        _upcomingMovies = movies;
      }else if(category == 'on-air'){
        movies = await moviesRepository.getOnAirTvShows();
        _onAir = movies;
      }else{
         movies = await moviesRepository.getTopRatedShows();
         _topRatedShows = movies;
      }
      emit(MediaListLoaded(movies: movies));
     // return movies;
    } catch (e) {
      emit(MoviesError( message: 'Failed to load movies'));
     // return null;
    }
  }

  void findMediaByKeyword(String keyword)async{
    emit(MoviesLoading());
    try{
    List<Media> media =  await moviesRepository.findMediaByKeyword(keyword);
      print('data is loaded');
      if(media.isNotEmpty){
        emit(SearchedListLoaded(media: media));
      }else{
        emit(MoviesError(message: 'Cannot Find Matching results'));
      }
    }catch(e){
      emit(MoviesError(message: 'cannot find data'));
    }

  }
}
