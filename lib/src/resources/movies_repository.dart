import 'i_movies_repository.dart';
import 'dart:async';
import 'movies_api_provider.dart';
import '../model/movies.dart';

class MoviesRepository extends IMovieRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<Movies> fetchTrendingMovies() =>
      moviesApiProvider.fetchTrendingMovies();

  Future<Movies> fetchDiscoverMovies() =>
      moviesApiProvider.fetchDiscoverMovies();

  Future<Movies> searchByMovieName(String movieName) =>
      moviesApiProvider.searchByMovieName(movieName);
}
