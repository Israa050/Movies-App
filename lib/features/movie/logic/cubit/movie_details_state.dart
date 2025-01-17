part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoaded extends MovieDetailsState{
  final Movie movie;
  final Cast casts;
  MovieDetailsLoaded({required this.movie,required this.casts});
}

final class Loading extends MovieDetailsState{}

final class CastsLoaded extends MovieDetailsState{
  final Cast casts;

  CastsLoaded({required this.casts});

}

final class ErrorState extends MovieDetailsState{
  final String message;

  ErrorState({required this.message});
}
