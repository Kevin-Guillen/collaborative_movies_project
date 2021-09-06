import '../model/movies.dart';

abstract class IMoviesRepository {
  Future<Movies> fetchTrendingMovies();

  Future<Movies> fetchDiscoverMovies();

  Future<Movies> searchByMovieName(String movieName);
}
