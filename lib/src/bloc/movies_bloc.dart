import 'dart:async';
import '../events.dart';
import '../resources/movies_repository.dart';
import '../state_type.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  bool isTextFieldEmpty = true;
  late MoviesRepository _moviesRepository;

  StreamController<StateType> _trendingMoviesStream =
      StreamController<StateType>.broadcast();

  StreamController<StateType> _discoverMoviesStream =
      StreamController<StateType>.broadcast();

  MoviesBloc([MoviesRepository? moviesRepository])
      : _moviesRepository = moviesRepository ?? MoviesRepository();

  @override
  Stream<StateType> get cardSwiperMoviesStream => _trendingMoviesStream.stream;

  @override
  Stream<StateType> get gridMoviesStream => _discoverMoviesStream.stream;

  void getMoviesState(Events event, [String movieName = ""]) async {
    switch (event) {
      case Events.fetchTrendingMovies:
        fetchTrendingMoviesEvent();
        break;
      case Events.searchByMovieName:
        searchByMovieNameEvent(movieName);
        break;
      case Events.fetchDiscoverMovies:
        fetchDiscoverMoviesEvent();
        break;
    }
  }

  void fetchTrendingMoviesEvent() async {
    final trendingMoviesList = await _moviesRepository.fetchTrendingMovies();
    if (!trendingMoviesList.getError) {
      _trendingMoviesStream.sink.add(
        StateType(
            movies: trendingMoviesList, stateType: MoviesStateType.success),
      );
      isTextFieldEmpty = true;
    } else {
      _trendingMoviesStream.sink.add(
        StateType(stateType: MoviesStateType.error),
      );
    }
  }

  void searchByMovieNameEvent(String movieName) async {
    final searchMoviesList =
        await _moviesRepository.searchByMovieName(movieName);
    if (!searchMoviesList.getError) {
      if (searchMoviesList.results!.isEmpty) {
        _trendingMoviesStream.sink.add(
          StateType(stateType: MoviesStateType.empty),
        );
      } else {
        _trendingMoviesStream.sink.add(
          StateType(
              movies: searchMoviesList, stateType: MoviesStateType.success),
        );
      }
    } else {
      _trendingMoviesStream.sink.add(
        StateType(stateType: MoviesStateType.error),
      );
    }
  }

  void fetchDiscoverMoviesEvent() async {
    final discoverMoviesList = await _moviesRepository.fetchDiscoverMovies();
    if (!discoverMoviesList.getError) {
      _discoverMoviesStream.sink.add(
        StateType(
            movies: discoverMoviesList, stateType: MoviesStateType.success),
      );
    } else {
      _discoverMoviesStream.sink.add(
        StateType(stateType: MoviesStateType.error),
      );
    }
  }

  @override
  void fetchByMovieName(String textField) async {
    if (textField.isEmpty) {
      getMoviesState(Events.fetchTrendingMovies);
    } else {
      getMoviesState(Events.searchByMovieName, textField);
    }
    isTextFieldEmpty = textField.isEmpty ? true : false;
  }

  @override
  void initialize() {}

  @override
  void dispose() {
    _trendingMoviesStream.close();
    _discoverMoviesStream.close();
  }
}
