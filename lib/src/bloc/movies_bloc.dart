import 'dart:async';

import '../model/movies.dart';
import '../resources/movies_repository.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  MoviesRepository _moviesRepository = MoviesRepository();
  StreamController<Movies> _moviesStreamController = StreamController();

  @override
  void initialize() {}

  @override
  void dispose() {
    _moviesStreamController.close();
  }

  @override
  void fetchMovies() async {
    final movieList = await _moviesRepository.fetchAllMovies();
    _moviesStreamController.sink.add(
      movieList,
    );
  }

  @override
  Stream<Movies> get stream => this._moviesStreamController.stream;
}
