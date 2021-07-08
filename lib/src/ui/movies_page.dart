import 'package:flutter/material.dart';
import '../bloc/i_movies_bloc.dart';
import '../widgets/card_swiper.dart';
import '../widgets/grid_view.dart';
import '../model/movies.dart';
import '../bloc/movies_bloc.dart';
import '../utils/ui_constants.dart';

class MoviesPage extends StatefulWidget {
  final IMoviesBloc bloc;

  const MoviesPage({Key? key, required this.bloc}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MoviesBloc _moviesBloc = MoviesBloc();
  Movies? _trendingMovies;
  Movies? _discoverMovies;

  void _getTrendingMovies() {
    _moviesBloc.cardSwiperMoviesStream.listen((getTrendingMoviesEvent) {
      _trendingMovies = getTrendingMoviesEvent;
      setState(() {});
    });
  }

  void _getDiscoverMovies() {
    _moviesBloc.gridMoviesStream.listen((getDiscoverMoviesEvent) {
      _discoverMovies = getDiscoverMoviesEvent;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _moviesBloc.fetchTrendingMovies();
    _moviesBloc.fetchDiscoverMovies();
    _getTrendingMovies();
    _getDiscoverMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          UiConstants.appBarHeight,
        ),
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(
                  UiConstants.childrenPadding,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: UiConstants.appBarTopPadding,
                  ),
                  child: Text(
                    "Movies App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: UiConstants.titleFontSize,
                      fontFamily: 'Play-Bold',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: UiConstants.searchBarSidesPadding,
                  right: UiConstants.searchBarSidesPadding,
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: UiConstants.searchTextFontSize,
                    fontFamily: 'Play-Bold',
                  ),
                  decoration: InputDecoration(
                    hintText: "Search for a movie...",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    suffixIcon: const Icon(
                      Icons.search_rounded,
                      color: Colors.purple,
                      size: UiConstants.searchIconSize,
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: UiConstants.searchTextPadding,
                      right: UiConstants.searchTextPadding,
                      top: UiConstants.searchTextPadding,
                    ),
                    filled: true,
                    fillColor: Colors.white12,
                  ),
                  onChanged: (textField) {
                    _moviesBloc.fetchByMovieName(textField);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            UiConstants.bodyPadding,
          ),
          child: Column(
            children: <Widget>[
              CardSwiper(
                trendingMovies: _trendingMovies,
                bloc: _moviesBloc,
              ),
              GridMovies(
                discoverMovies: _discoverMovies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
