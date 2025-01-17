

import 'dart:convert';

import 'package:movies_neon_design/core/utils/constants.dart';
import 'package:movies_neon_design/features/movie/data/model/movie.dart';
import 'package:http/http.dart' as http;

class ApiTest {


  static Future<void> getResponse()async{

    try {
      final response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.nowPlaying}?api_key=1fced2fe81ec588d4e74e08d1bcc8358'));
    if(response.statusCode == 200){
      print('===========================================================');
        final data = json.decode(response.body);
      final List<Movie> movies = (data['results'] as List)
          .map((movieJson) {
            print(Movie.fromJson(movieJson).posterPath);
           return Movie.fromJson(movieJson);
          })
          .toList();
     //     print(data['results'].map((m)=> Movie.fromJson(m)));
      // for(int i = 0; i<movies.length;i++){
      //   print(movies[i].backdropPath);
      //   print(movies[i].posterPath);
      //   print(movies[i].title);
      //   print('====================================');
      // }
    } 
    } catch (e) {
      print('Teest API Error');
      throw e.toString();
    }
  

  }
}