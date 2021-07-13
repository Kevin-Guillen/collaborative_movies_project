import 'dart:async';
import '../model/movies.dart';
import '../resources/movies_repository.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  bool isTextFieldEmpty = true;
  MoviesRepository _moviesRepository = MoviesRepository();
  StreamController<Movies> _trendingMoviesStream =
      StreamController<Movies>.broadcast();
  StreamController<Movies> _discoverMoviesStream =
      StreamController<Movies>.broadcast();

  @override
  void initialize() {}

  @override
  void dispose() {
    _trendingMoviesStream.close();
    _discoverMoviesStream.close();
  }

  void fetchTrendingMovies() async {
    final trendingMovieList = await _moviesRepository.fetchTrendingMovies();
    _trendingMoviesStream.sink.add(
      trendingMovieList,
    );
  }

  void fetchDiscoverMovies() async {
    final discoverMovieList = await _moviesRepository.fetchDiscoverMovies();
    _discoverMoviesStream.sink.add(
      discoverMovieList,
    );
  }

  @override
  void fetchByMovieName(String textField) async {
    if (textField.isEmpty) {
      fetchTrendingMovies();
    } else {
      final searchMoviesResults = await _moviesRepository.searchByMovieName(
        textField,
      );
      _trendingMoviesStream.sink.add(
        searchMoviesResults,
      );
    }
    isTextFieldEmpty = textField.isEmpty ? true : false;
  }

  @override
  Stream<Movies> get cardSwiperMoviesStream => _trendingMoviesStream.stream;

  @override
  Stream<Movies> get gridMoviesStream => _discoverMoviesStream.stream;
}
