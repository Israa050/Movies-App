
class Trailer {

  List<Video>? results;

  Trailer({required this.results});

    factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      results: (json['results'] as List)
          .map((trailer) => Video.fromJson(trailer))
          .toList(),
    );
  }
}

class Video{

  String? key;
  String? type;
  bool? official;


  Video({required this.key,required this.type,required this.official});

    factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      key: json['key'],
      type: json['type'],
      official: json['official'],
    );
  }

}