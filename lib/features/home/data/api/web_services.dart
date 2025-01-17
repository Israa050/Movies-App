


import 'package:dio/dio.dart';
import 'package:movies_neon_design/core/model/cast.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/utils/constants.dart';
import 'package:movies_neon_design/features/home/data/model/api_result.dart';
import 'package:movies_neon_design/features/trailer/data/model/trailer.dart';
import 'package:movies_neon_design/features/tv/data/model/tv_show.dart';
import 'package:movies_neon_design/features/movie/data/model/movie.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class WebServices {

  factory WebServices(Dio dio,{String baseUrl}) = _WebServices;

  @GET(Constants.nowPlaying)
  Future<APIResult> getNowPlayingMovies(@Query('api_key') String apiKey,);

  
  @GET('trending/all/{time_window}')
  Future<APIResult> getTrendingMovies(@Path('time_window') String timeWindow, @Query('api_key') String apiKey);

  @GET('movie/{id}')
  Future<Movie> getMovieById(@Query('api_key') String apiKey,@Path() int id);

  @GET('movie/{id}/credits')
  Future<Cast> getMoviesCasts(@Query('api_key') String apiKey,@Path() int id);

  @GET('tv/{series_id}')
  Future<TvShow> getTVShowById(@Query('api_key') String apiKey,@Path('series_id') int id);

  @GET('tv/{series_id}/credits')
  Future<Cast> getTvCasts(@Query('api_key') String apiKey,@Path('series_id') int id);

  @GET('movie/{movie_id}/videos')
  Future<Trailer> getMovieTrailers(@Query('api_key') String apiKey,@Path('movie_id') int id);
  
  @GET('tv/{series_id}/videos')
  Future<Trailer> getTvTrailers(@Query('api_key') String apiKey,@Path('series_id') int id);

  @GET('movie/popular')
  Future<APIResult> getPopularMovies(@Query('api_key') String apiKey,@Query('page') int page);

  @GET('movie/top_rated')
  Future<APIResult> getTopRatedMovies(@Query('api_key') String apiKey);

  @GET('movie/upcoming')
  Future<APIResult> getUpcomingMovies(@Query('api_key') String apiKey);

  @GET('tv/top_rated')
  Future<APIResult> getTopRatedTvShows(@Query('api_key') String apiKey);

  @GET('tv/on_the_air')
  Future<APIResult> getOnAirTvShows(@Query('api_key') String apiKey);
  
  @GET('search/multi')
  Future<APIResult> findMediaByKeyword(@Query('api_key') String apiKey,@Query('query') String keyword);
  

  static Dio createAndSetupDio(){

    Dio dio = Dio();
    dio
    ..options.connectTimeout = const Duration(seconds: 20)
    ..options.receiveTimeout = const Duration(seconds: 20);
   
   dio.interceptors.add(
    LogInterceptor(
    requestBody: true,
    error: true,
    requestHeader: true,
    responseHeader: false,
    responseBody: true,
    request: true,
   ));

   dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // options.headers.addAll({
        //   'api_key': 'e8ec5c5c3d13ce861309613cb28148da',
        // });
       // Add the access token to the request header
      //  options.headers.addAll({
      //   'accept':'application/json'
      //  });
       //options.headers['api_key'] = '1fced2fe81ec588d4e74e08d1bcc8358';
       options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZmNlZDJmZTgxZWM1ODhkNGU3NGUwOGQxYmNjODM1OCIsIm5iZiI6MTcyOTQyODUyMi44NTg4NDksInN1YiI6IjY0OTFhYzQ4YzJmZjNkMDBjNTliYzNiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hN0R7mcvQeYIZrdceKWe3mJR_SheXcnq8F6DfILq1lU';
       //options.headers['Authorization'] = 'Bearer 1fced2fe81ec588d4e74e08d1bcc8358';
       //options.headers['Authorization'] = 'Bearer 1fced2fe81ec588d4e74e08d1bcc8358';
      return handler.next(options);
      },
    ),
   );

    return dio;
  }


}


// class AuthInterceptor extends Interceptor {
//   final Dio dio;

//   AuthInterceptor({
//     required this.dio,
//   });

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     // Add your API key & other stuff to the headers.
//     options.headers.addAll({
//       "X-RapidAPI-Key": "YOUR_API_KEY"
//     });
//     options.headers
//         .addAll({"X-RapidAPI-Host": "moviesminidatabase.p.rapidapi.com"});
//     handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       // Refresh the token if the request results with status code of 401.
//       return handler
//           .resolve(await dio.fetch(err.requestOptions)); // Repeat the request.
//     }

//     return handler.reject(DioException(
//       requestOptions: err.requestOptions,
//       error: err.response,
//     ));
//   }
// }