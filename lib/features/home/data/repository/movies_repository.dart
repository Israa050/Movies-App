import 'package:hive/hive.dart';
import 'package:movies_neon_design/core/local_db/movies_local_db.dart';
import 'package:movies_neon_design/core/model/cast.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:movies_neon_design/core/network/networking.dart';
import 'package:movies_neon_design/core/utils/constants.dart';
import 'package:movies_neon_design/features/home/data/api/web_services.dart';
import 'package:movies_neon_design/features/home/data/model/api_result.dart';
import 'package:movies_neon_design/features/trailer/data/model/trailer.dart';
import 'package:movies_neon_design/features/tv/data/model/tv_show.dart';
import 'package:movies_neon_design/features/movie/data/model/movie.dart';

class MoviesRepository {
  final WebServices webServices;
  MoviesRepository(this.webServices);

  Future<List<Media>?> getNowPlayingMovies() async {
    try {
      var response = await webServices
          .getNowPlayingMovies('1fced2fe81ec588d4e74e08d1bcc8358');
      //if(response.results!.isNotEmpty){
      //await _storeMediaList(response.results!, boxName: Constants.nowPlayingMoviesBox);
      // }
      print('REPO HAS:');
      print(response);
      return response.results;
    } catch (e) {
      print('Error : is Here ${e.toString()}');
      return [];
    }
  }

  //cache data
  Future _storeMediaList(List<Media> mediaList,
      {required String boxName}) async {
    final MoviesLocalDb localDb = MoviesLocalDb();
    await localDb.init(boxName);
    await localDb.cacheMovies(mediaList);
    localDb.closeBox();
  }

  //retrieve data
  Future<List<Media>> _getMediaList(String boxName) async {
    final MoviesLocalDb localDb = MoviesLocalDb();
    await localDb.init(boxName);
    final media = await localDb.getCachedMovies();
    localDb.closeBox();
    return media;
  }

  Future<List<Media>> getTrendingMovies() async {
    try {
      bool isConnected = await NetworkInfo.isConnected();
      List<Media> mediaList;

      print('connection state is $isConnected');

        var response = await webServices.getTrendingMovies(
            'day', '1fced2fe81ec588d4e74e08d1bcc8358');
        mediaList = response.results!;

      // if (isConnected) {
      //   print('Branch A');
      //   var response = await webServices.getTrendingMovies(
      //       'day', '1fced2fe81ec588d4e74e08d1bcc8358');
      //   mediaList = response.results!;
      //   if (response.results != null) {
      //     print('Branch A-1');
      //     print('DATA');
      //     _storeMediaList(mediaList, boxName: Constants.moviesBox);
      //     mediaList = response.results!;
      //   }else{
      //     print('Branch A-2');
      //     List<Media> response2 = await _getMediaList(Constants.moviesBox);
      //     mediaList = response2;
      //   }
      // } else {
      //   print('Branch B');
      //     List<Media> response2 = await _getMediaList(Constants.moviesBox);
      //     mediaList = response2;
      // }
      print('DATA IS HERE:');
      print(mediaList);
      print(mediaList[0].posterPath);
      print(mediaList[0].mediaType);
      return mediaList;
    } catch (e) {
      rethrow;
    }
  }

  Future<Movie> getMovieById(int id) async {
    var response =
        await webServices.getMovieById('1fced2fe81ec588d4e74e08d1bcc8358', id);
    return response;
  }

  Future<Cast> getMoviesCasts(int id) async {
    var response = await webServices.getMoviesCasts(
        '1fced2fe81ec588d4e74e08d1bcc8358', id);
    return response;
  }

  Future<TvShow> getTVShowById(int id) async {
    var response =
        await webServices.getTVShowById('1fced2fe81ec588d4e74e08d1bcc8358', id);
    return response;
  }

  Future<Cast> getTvCasts(int id) async {
    var response =
        await webServices.getTvCasts('1fced2fe81ec588d4e74e08d1bcc8358', id);
    return response;
  }

  Future<Trailer> getMovieTrailers(int id) async {
    var response = await webServices.getMovieTrailers(
        '1fced2fe81ec588d4e74e08d1bcc8358', id);
    return response;
  }

  Future<Trailer> getTvTrailers(int id) async {
    var response =
        await webServices.getTvTrailers('1fced2fe81ec588d4e74e08d1bcc8358', id);
    return response;
  }

  Future<APIResult> getPopularMovies(int page) async {
    var response =
        await webServices.getPopularMovies('1fced2fe81ec588d4e74e08d1bcc8358',page);
    // if(response.results!.isNotEmpty){
    // await _storeMediaList(response.results!, boxName: Constants.popularMoviesBox);
    //}
    return response;
  }

  Future<List<Media>> getTopRatedMovies() async {
    var response =
        await webServices.getTopRatedMovies('1fced2fe81ec588d4e74e08d1bcc8358');
    // if(response.results!.isNotEmpty){
    // await _storeMediaList(response.results!, boxName: Constants.topRatedMoviesBox);
    //}
    return response.results!;
  }

  Future<List<Media>> getUpcomingMovies() async {
    var response =
        await webServices.getUpcomingMovies('1fced2fe81ec588d4e74e08d1bcc8358');
    //if(response.results!.isNotEmpty){
    //await _storeMediaList(response.results!, boxName: Constants.upcomingMoviesBox);
    //}
    return response.results!;
  }

  Future<List<Media>> getOnAirTvShows() async {
    var response =
        await webServices.getOnAirTvShows('1fced2fe81ec588d4e74e08d1bcc8358');
    //if(response.results!.isNotEmpty){
    //await _storeMediaList(response.results!, boxName: Constants.onAirTVBox);
    //}
    return response.results!;
  }

  Future<List<Media>> getTopRatedShows() async {
    var response = await webServices
        .getTopRatedTvShows('1fced2fe81ec588d4e74e08d1bcc8358');
    //if(response.results!.isNotEmpty){
    //await _storeMediaList(response.results!, boxName: Constants.topRatedShowsBox);
    //}
    return response.results!;
  }

  Future<List<Media>> findMediaByKeyword(String keyword) async {
    var response = await webServices.findMediaByKeyword(
        '1fced2fe81ec588d4e74e08d1bcc8358', keyword);
    return response.results!;
  }
}
