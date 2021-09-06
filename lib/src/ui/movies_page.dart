import 'package:flutter/material.dart';
import '../bloc/i_movies_bloc.dart';
import '../card_swiper_events.dart';
import '../events.dart';
import '../grid_movies_events.dart';
import '../model/movies.dart';
import '../state_type.dart';
import '../utils/movies_strings.dart';
import '../utils/ui_constants.dart';
import '../widgets/homeScreenWidgets/navigation_drawer.dart';
import '../utils/colors_movies.dart';

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
  late bool _isSearching;

  @override
  void initState() {
    super.initState();
    widget.bloc.getMoviesState(Events.fetchTrendingMovies);
    widget.bloc.getMoviesState(Events.fetchDiscoverMovies);
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
            color: ColorsMovies.colorARGB,
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: !_isSearching
              ? Image.asset(
                  MoviesStrings.brhokeLogo,
                  height: UiConstants.logoHeight,
                )
              : TextField(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: UiConstants.searchTextFontSize,
                    fontFamily: MoviesStrings.textStyleFontFamily,
                  ),
                  decoration: InputDecoration(
                    hintText: MoviesStrings.inputText,
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
                      color: ColorsMovies.colorARGB,
                      size: UiConstants.iconSize,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _isSearching = false;
                          widget.bloc
                              .getMoviesState(Events.fetchTrendingMovies);
                        },
                      );
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.search,
                      color: ColorsMovies.colorARGB,
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
              StreamBuilder<StateType>(
                initialData: _getInitialData(),
                stream: widget.bloc.cardSwiperMoviesStream,
                builder: (context, AsyncSnapshot<StateType> snapshot) {
                  return snapshot.hasData
                      ? CardSwiperEvents(
                          state: snapshot.data!,
                          isTextFieldEmpty: widget.bloc.isTextFieldEmpty,
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
              StreamBuilder<StateType>(
                initialData: _getInitialData(),
                stream: widget.bloc.gridMoviesStream,
                builder: (context, AsyncSnapshot<StateType> snapshot) {
                  return snapshot.hasData
                      ? GridMoviesEvents(
                          state: snapshot.data!,
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  StateType _getInitialData() {
    return StateType(
      stateType: MoviesStateType.loading,
      movies: Movies(
          error: false, page: 0, totalPages: 0, totalResults: 0, results: []),
    );
  }
}
