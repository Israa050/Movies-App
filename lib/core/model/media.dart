


import 'package:hive_flutter/hive_flutter.dart';

part 'media.g.dart';

@HiveType(typeId: 0)
class Media{

  @HiveField(0)
  bool? adult;

  @HiveField(1)
  String? backdropPath;


  @HiveField(2)
  int? id;

  @HiveField(3)
  String? overview;

  @HiveField(4)
  String? posterPath;

  @HiveField(5)
  String? originalLanguage;

  @HiveField(6)
  double? popularity;

  @HiveField(7)
  double? voteAverage;

  @HiveField(8)
  int? voteCount;

  @HiveField(9)
  List<int>? genreIds;

  @HiveField(10)
  String? mediaType;

  Media(
      {this.backdropPath,
      this.id,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.adult,
      this.originalLanguage,
      this.genreIds,
      this.popularity,
      this.voteAverage,
      this.voteCount});

  set setmediaType(String? type) {
    mediaType = type;
  }

  String? get getmediaType => mediaType;

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: json['genre_ids'].cast<int>(),
      popularity: json['popularity'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      mediaType: json['media_type'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['adult'] = adult;
    data['original_language'] = originalLanguage;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}



  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['backdrop_path'] = this.backdropPath;
  //   data['id'] = this.id;
  //   data['overview'] = this.overview;
  //   data['poster_path'] = this.posterPath;
  //   data['media_type'] = this.mediaType;
  //   data['adult'] = this.adult;
  //   data['original_language'] = this.originalLanguage;
  //   data['genre_ids'] = this.genreIds;
  //   data['popularity'] = this.popularity;
  //   data['vote_average'] = this.voteAverage;
  //   data['vote_count'] = this.voteCount;
  //   return data;
  // }


//movie data

/*
   title
   video
   original title
   relesedate
*/


//tv data

/*
   name
   original name
   firstAirDate
   originCountry
*/