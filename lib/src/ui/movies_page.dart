import 'package:flutter/material.dart';
import 'package:movies_project/src/bloc/movies_bloc.dart';
import 'package:movies_project/src/model/movies.dart';
import '../bloc/movies_bloc.dart';
import '../utils/ui_constants.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MoviesBloc _moviesBloc = MoviesBloc();

  @override
  void initState() {
    super.initState();
    _moviesBloc.fetchTrendingMovies();
    _moviesBloc.fetchDiscoverMovies();
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
                  padding:
                      const EdgeInsets.only(top: UiConstants.appBarTopPadding),
                  child: Text(
                    "Movies App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: UiConstants.titleFontSize,
                        fontFamily: 'Play-Bold'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: UiConstants.searchBarSidesPadding,
                    right: UiConstants.searchBarSidesPadding),
                child: TextField(
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: UiConstants.searchTextFontSize,
                      fontFamily: 'Play-Bold'),
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
                          top: UiConstants.searchTextPadding),
                      filled: true,
                      fillColor: Colors.white12),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UiConstants.bodyPadding),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: UiConstants.movieTypeTextPadding),
                  child: new Text(
                    'Trending Movies',
                    style: TextStyle(
                        fontSize: UiConstants.movieTypeTitleFontSize,
                        color: Colors.grey,
                        fontFamily: 'Play-Bold'),
                  ),
                ),
              ),
              StreamBuilder(
                stream: _moviesBloc.swiper,
                builder: (
                  context,
                  AsyncSnapshot<Movies> snapshot,
                ) {
                  return snapshot.hasData
                      ? _swiper(
                          snapshot,
                        )
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: UiConstants
                                    .swiperProgressIndicatorTopPadding),
                            child: CircularProgressIndicator(
                              strokeWidth:
                                  UiConstants.progressIndicatorStrokeWidth,
                              backgroundColor: Colors.purple,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.black),
                            ),
                          ),
                        );
                },
              ),
              StreamBuilder(
                stream: _moviesBloc.stream,
                builder: (
                  context,
                  AsyncSnapshot<Movies> snapshot,
                ) {
                  return snapshot.hasData
                      ? buildList(
                          snapshot,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              top: UiConstants.gridProgressIndicatorTopPadding),
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth:
                                  UiConstants.progressIndicatorStrokeWidth,
                              backgroundColor: Colors.purple,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.black),
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _swiper(AsyncSnapshot snapshot) {
    return Container(
        height: UiConstants.swiperCardsHeight,
        child: Container(
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                snapshot.data.results[index].posterPath,
                fit: BoxFit.fill,
              );
            },
            itemCount: snapshot.data.results.length,
            itemWidth: UiConstants.swiperCardsWidth,
            layout: SwiperLayout.STACK,
          ),
        ));
  }

  buildList(AsyncSnapshot snapshot) {
    return snapshot.hasData
        ? Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: UiConstants.movieTypeTextPadding,
                      bottom: UiConstants.movieTypeTextPadding),
                  child: new Text(
                    'Discover movies',
                    style: TextStyle(
                        fontSize: UiConstants.movieTypeTitleFontSize,
                        color: Colors.grey,
                        fontFamily: 'Play-Bold'),
                  ),
                ),
              ),
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data.results.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: UiConstants.mainAxisExtent,
                    crossAxisCount: UiConstants.gridColumns,
                  ),
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return GridTile(
                      child: Container(
                        margin: EdgeInsets.all(
                          UiConstants.gridTileMargin,
                        ),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  UiConstants.gridCardsBorderRadius),
                              bottomRight: Radius.circular(
                                  UiConstants.gridCardsBorderRadius),
                            ),
                            child: Image.network(
                              snapshot.data.results[index].posterPath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : Container();
  }
}
