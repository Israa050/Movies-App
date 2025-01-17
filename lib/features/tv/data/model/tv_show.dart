
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_neon_design/core/model/media.dart';


@JsonSerializable()
class TvShow extends Media {


  String? name;
   String? originalName;
   @JsonKey(name: 'number_of_episodes')
   int? numberOfEpisodes;
   @JsonKey(name: 'number_of_seasons')
   int? numberOfSeasons;
   //Date? firstAirDate
   //String? originCountry;

  TvShow({
    super.adult,
      super.backdropPath,
      super.id,
      super.mediaType,
      super.originalLanguage,
      super.overview,
      super.popularity,
      super.posterPath,
      super.voteAverage,
      super.voteCount,
    this.name,
    this.originalName,
    this.numberOfEpisodes,
    this.numberOfSeasons
  });


  factory TvShow.fromJson(Map<String,dynamic> json){
    return TvShow(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      id: json['id'],
      mediaType: json['media_type'],
      originalLanguage: json['original_language'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      name: json['name'],
      originalName: json['original_name'],
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons']
    //  originCountry: json['origin_country'],
    );
  }



}
