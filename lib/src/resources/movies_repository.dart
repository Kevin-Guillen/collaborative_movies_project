import 'i_movies_repository.dart';
import 'dart:async';
import 'movies_api_provider.dart';
import '../model/movies.dart';

class MoviesRepository extends IMovieRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<Movies> fetchAllMovies() => moviesApiProvider.fetchMoviesList();
}
