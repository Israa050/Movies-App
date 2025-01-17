part of 'trailer_cubit.dart';

@immutable
sealed class TrailerState {}

final class TrailerInitial extends TrailerState {}

final class TrailersLoaded extends TrailerState{
  final Trailer trailers;

  TrailersLoaded({required this.trailers});
}

final class TrailerError extends TrailerState{
  final String message;
  TrailerError({required this.message});
}

final class TrailerLoading extends TrailerState{}

