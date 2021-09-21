import 'i_movies_repository.dart';
import 'dart:async';
import 'movies_api_provider.dart';
import '../model/movies.dart';

class MoviesRepository extends IMoviesRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<Movies> fetchTrendingMovies() =>
      moviesApiProvider.fetchTrendingMovies();

  Future<Movies> fetchDiscoverMovies(String movieName) =>
      moviesApiProvider.fetchDiscoverMovies(movieName);

  Future<Movies> searchByMovieName(String movieName) =>
      moviesApiProvider.searchByMovieName(movieName);
}
