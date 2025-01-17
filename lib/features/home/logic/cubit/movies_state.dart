part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoading extends MoviesState{}

final class MoviesLoaded extends MoviesState{
  final List<Media> movies;

  MoviesLoaded({required this.movies});
}



final class MoviesError extends MoviesState{
  final String message;
  MoviesError({required this.message});
}

final class MovieLoaded extends MoviesState{
  final Movie movie;
  MovieLoaded({required this.movie});
}

final class CastsLoaded extends MoviesState{
  final List<Cast> casts;
  CastsLoaded({required this.casts});
}

final class MediaListLoaded extends MoviesState{
  final List<Media> movies;
  MediaListLoaded({required this.movies});
}

final class SearchedListLoaded extends MoviesState{
  final List<Media> media;
  SearchedListLoaded({required this.media});
}

final class SearchedTvListLoaded extends MoviesState{
  final List<Media> media;
  SearchedTvListLoaded({required this.media});
}
