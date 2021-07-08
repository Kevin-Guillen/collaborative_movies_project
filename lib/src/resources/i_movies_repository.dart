import '../model/movies.dart';

abstract class IMovieRepository {
  Future<Movies> fetchTrendingMovies();

  Future<Movies> fetchDiscoverMovies();
}
