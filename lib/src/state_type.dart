import 'model/movies.dart';

class StateType {
  StateType({
    this.movies,
    required this.stateType,
  });

  final Movies? movies;
  final MoviesStateType stateType;
}

enum MoviesStateType {
  loading,
  success,
  empty,
  error,
}
