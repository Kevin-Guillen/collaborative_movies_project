import 'dart:async';

import '../model/movies.dart';
import '../resources/movies_repository.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  MoviesRepository _moviesRepository = MoviesRepository();
  StreamController<Movies> _moviesStreamController = StreamController();
  StreamController<Movies> _swiper = StreamController();

  @override
  void initialize() {}

  @override
  void dispose() {
    _moviesStreamController.close();
    _swiper.close();
  }

  void fetchTrendingMovies() async {
    final trendingMovieList = await _moviesRepository.fetchTrendingMovies();
    _swiper.sink.add(
      trendingMovieList,
    );
  }

  void fetchDiscoverMovies() async {
    final discoverMovieList = await _moviesRepository.fetchDiscoverMovies();
    _moviesStreamController.sink.add(
      discoverMovieList,
    );
  }

  @override
  Stream<Movies> get stream => _moviesStreamController.stream;

  @override
  Stream<Movies> get swiper => _swiper.stream;
}
