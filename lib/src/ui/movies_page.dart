import 'package:flutter/material.dart';
import '../widgets/homeScreenWidgets/navigation_drawer.dart';
import '../bloc/i_movies_bloc.dart';
import '../widgets/homeScreenWidgets/card_swiper.dart';
import '../widgets/homeScreenWidgets/grid_view.dart';
import '../model/movies.dart';
import '../utils/ui_constants.dart';
import '../utils/movie_string.dart';

class MoviesPage extends StatefulWidget {
  final IMoviesBloc bloc;

  const MoviesPage({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Movies? _swiperTrendingMovies;
  Movies? _gridDiscoverMovies;
  late bool _isSearching;

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
    _isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          UiConstants.appBarHeight,
        ),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.purple,
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: !_isSearching
              ? Image.asset(
                  MovieStrings.brhokeLogo,
                  height: UiConstants.logoHeight,
                )
              : TextField(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: UiConstants.searchTextFontSize,
                    fontFamily: MovieStrings.textStyleFontFamily,
                  ),
                  decoration: InputDecoration(
                    hintText: MovieStrings.inputText,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    contentPadding: const EdgeInsets.all(
                      UiConstants.searchTextPadding,
                    ),
                    filled: true,
                    fillColor: Colors.white12,
                  ),
                  onChanged: (textField) {
                    widget.bloc.fetchByMovieName(textField);
                  },
                ),
          actions: [
            _isSearching
                ? IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.purple,
                      size: UiConstants.iconSize,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _isSearching = false;
                          widget.bloc.fetchTrendingMovies();
                        },
                      );
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.purple,
                      size: UiConstants.iconSize,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _isSearching = true;
                        },
                      );
                    },
                  ),
          ],
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
