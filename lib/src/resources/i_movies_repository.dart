import '../model/movies.dart';

abstract class IMoviesRepository {
  Future<Movies> fetchTrendingMovies();

  Future<Movies> fetchDiscoverMovies(String movieName);

  Future<Movies> searchByMovieName(String movieName);
}
