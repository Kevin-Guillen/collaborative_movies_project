import '../model/movies.dart';

abstract class IMovieRepository {
  Future<Movies> fetchAllMovies();
}
