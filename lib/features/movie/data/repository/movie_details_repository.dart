
import 'package:movies_neon_design/features/home/data/api/web_services.dart';
import 'package:movies_neon_design/features/movie/data/model/movie.dart';

class MovieDetailsRepository {

   final WebServices webServices;
  MovieDetailsRepository(this.webServices);


  Future<Movie> getMovieById(int id)async{
    var response = await webServices.getMovieById('1fced2fe81ec588d4e74e08d1bcc8358', id);
    return response;
  }
  
}