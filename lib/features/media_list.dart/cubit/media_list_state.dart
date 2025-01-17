part of 'media_list_cubit.dart';

@immutable
sealed class MediaListState {}

final class MediaListInitial extends MediaListState {}

final class MediaListLoadedtwo extends MediaListState{
  final List<Media> media;

  MediaListLoadedtwo({required this.media});
}

final class Loading extends MediaListState{}

final class ErrorState extends MediaListState{
  final String message;
  ErrorState({required this.message});
}
