import 'package:hive/hive.dart';
import 'package:movies_neon_design/core/model/media.dart';

class MoviesLocalDb {

  late Box<Media> moviesBox;

  Future init(String boxName)async{
    moviesBox =  await Hive.openBox<Media>(boxName);
  }

  Future closeBox()async{
    await moviesBox.close();
  }

  Future<List<Media>> getCachedMovies() async {
    List<Media> cachedData = moviesBox.values.toList();
    if (cachedData.isNotEmpty) {
      print('Media data ${cachedData[0].overview}}');
      return cachedData;
    } else {
      throw Exception('No cached data found');
    }
  }

  Future<void> cacheMovies(List<Media> movies) async {
    for (var movie in movies) {
    await moviesBox.put(movie.id, movie);  // Store each movie individually with its id
  }
  }
  
}