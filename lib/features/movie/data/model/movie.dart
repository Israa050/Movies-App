import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/features/home/data/model/genre.dart';


class Movie extends Media {
  String? originalTitle;
  String? releaseDate;
  String? title;
  bool? video;
  List<Genre>? genres;
  int? runtime;

  Movie(
      {super.adult,
      super.backdropPath,
      super.id,
      super.mediaType,
      super.originalLanguage,
      this.originalTitle,
      super.overview,
      super.popularity,
      super.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      super.voteAverage,
      super.voteCount,
      this.genres,
      this.runtime});

  factory Movie.fromJson(Map<String, dynamic> json) {
     List<Genre>? genresList;
    if (json['genres'] != null) {
      genresList = <Genre>[];
      json['genres'].forEach((v) {
        genresList!.add(Genre.fromJson(v));
      });
    }
    return Movie(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      id: json['id'],
      mediaType: json['media_type'],
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      genres: genresList,
      runtime: json['runtime']?? 0,
    );
  }


}
