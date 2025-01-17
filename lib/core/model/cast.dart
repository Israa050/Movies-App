class Cast {
  int? id;
  String? name;
  String? profilePath;
  List<ClsCast>? cast;

  Cast({this.id, this.name, this.profilePath, this.cast});

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      id: json['id'],
      cast: (json['cast'] as List)
          .map(
            (castItem) => ClsCast.fromJson(castItem),
          )
          .toList(),
    );
  }
}

class ClsCast {
  String? name;
  String? profilePath;

  ClsCast({this.name, this.profilePath});

  factory ClsCast.fromJson(Map<String, dynamic> json) {
    return ClsCast(
      name: json['name'],
      profilePath: json['profile_path'],
    );
  }
}
