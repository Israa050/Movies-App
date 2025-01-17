part of 'tv_cubit.dart';

@immutable
sealed class TvState {}

final class TvInitial extends TvState {}

final class TvLoaded extends TvState{
  final TvShow tvShow;
  final Cast tvCasts;

  TvLoaded({required this.tvShow,required this.tvCasts});
}

final class Loading extends TvState{}

final class TvErrorState extends TvState{
  final String message;

  TvErrorState({required this.message});
}
