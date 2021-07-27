import 'package:flutter/material.dart';
import '../bloc/i_movies_bloc.dart';
import '../widgets/homeScreenWidgets/card_swiper.dart';
import '../widgets/homeScreenWidgets/grid_view.dart';
import '../model/movies.dart';
import '../utils/ui_constants.dart';
import '../utils/movie_string.dart';

class MoviesPage extends StatefulWidget {
  final IMoviesBloc bloc;

  const MoviesPage({Key? key, required this.bloc}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Movies? _swiperTrendingMovies;
  Movies? _gridDiscoverMovies;

  void _getTrendingMovies() {
    widget.bloc.cardSwiperMoviesStream.listen(
      (getTrendingMoviesEvent) {
        _swiperTrendingMovies = getTrendingMoviesEvent;
        setState(() {});
      },
    );
  }

  void _getDiscoverMovies() {
    widget.bloc.gridMoviesStream.listen(
      (getDiscoverMoviesEvent) {
        _gridDiscoverMovies = getDiscoverMoviesEvent;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    widget.bloc.fetchTrendingMovies();
    widget.bloc.fetchDiscoverMovies();
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
                    hintText: MovieStrings.inputText,
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
                    widget.bloc.fetchByMovieName(textField);
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
                trendingMovies: _swiperTrendingMovies,
                isTextFieldEmpty: widget.bloc.isTextFieldEmpty,
              ),
              GridMovies(
                discoverMovies: _gridDiscoverMovies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
