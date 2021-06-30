import 'dart:async';

import '../model/movies.dart';
import 'bloc.dart';

abstract class IMoviesBloc extends Bloc {
  Stream<Movies> get stream;

  Stream<Movies> get swiper;

  void fetchTrendingMovies();

  void fetchDiscoverMovies();
}
