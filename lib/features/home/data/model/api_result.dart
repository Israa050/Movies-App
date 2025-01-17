
import 'package:hive/hive.dart';
import 'package:movies_neon_design/core/model/media.dart';




class APIResult extends HiveObject {

  int? page;
  int? totalPages;
  List<Media>? results;

  APIResult(
      {
      this.page,
      this.totalPages,
      this.results,
      });
    factory APIResult.fromJson(Map<String, dynamic> json) {
    return APIResult(
      page: json['page'],
      totalPages: json['total_pages'],
      results: (json['results'] as List)
          .map((movieJson) => Media.fromJson(movieJson))
          .toList(),
    );
  }

}

