import 'dart:async';

import '../model/movies.dart';
import 'bloc.dart';

abstract class IMoviesBloc extends Bloc {
  Stream<Movies> get stream;

  void fetchMovies();
}
