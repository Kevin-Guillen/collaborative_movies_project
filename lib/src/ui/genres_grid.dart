import 'package:flutter/material.dart';
import '../bloc/i_movies_bloc.dart';
import '../utils/movies_strings.dart';
import '../utils/ui_constants.dart';
import '../widgets/homeScreenWidgets/genre_box.dart';
import 'genre_results.dart';

class GenresGrid extends StatefulWidget {
  const GenresGrid({
    required this.genresBloc,
  });

  final IMoviesBloc genresBloc;

  @override
  _GenresGridState createState() => _GenresGridState();
}

class _GenresGridState extends State<GenresGrid> {
  List _genresList = [];

  _loadGenres() {
    _genresList.add(
      GenreBox(
        genreName: UiConstants.actionGenre,
        gridEndpoint: MoviesStrings.actionDiscoverMoviesEndpoint,
      ),
    );

    _genresList.add(
      GenreBox(
        genreName: UiConstants.adventureGenre,
        gridEndpoint: MoviesStrings.adventureDiscoverMoviesEndpoint,
      ),
    );

    _genresList.add(
      GenreBox(
        genreName: UiConstants.comedyGenre,
        gridEndpoint: MoviesStrings.comedyDiscoverMoviesEndpoint,
      ),
    );

    _genresList.add(
      GenreBox(
        genreName: UiConstants.crimeGenre,
        gridEndpoint: MoviesStrings.crimeDiscoverMoviesEndpoint,
      ),
    );

    _genresList.add(
      GenreBox(
        genreName: UiConstants.dramaGenre,
        gridEndpoint: MoviesStrings.dramaDiscoverMoviesEndpoint,
      ),
    );

    _genresList.add(
      GenreBox(
        genreName: UiConstants.familyGenre,
        gridEndpoint: MoviesStrings.familyDiscoverMoviesEndpoint,
      ),
    );

    _genresList.add(
      GenreBox(
        genreName: UiConstants.fantasyGenre,
        gridEndpoint: MoviesStrings.fantasyDiscoverMoviesEndpoint,
      ),
    );

    _genresList.add(
      GenreBox(
        genreName: UiConstants.historyGenre,
        gridEndpoint: MoviesStrings.historyDiscoverMoviesEndpoint,
      ),
    );

    _genresList.add(
      GenreBox(
        genreName: UiConstants.musicGenre,
        gridEndpoint: MoviesStrings.musicDiscoverMoviesEndpoint,
      ),
    );

    _genresList.add(
      GenreBox(
        genreName: UiConstants.terrorGenre,
        gridEndpoint: MoviesStrings.horrorDiscoverMoviesEndpoint,
      ),
    );
  }

  @override
  void initState() {
    _loadGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: UiConstants.genresTitleTopPadding,
            ),
            child: Text(
              UiConstants.genresTitle,
              style: TextStyle(
                fontSize: UiConstants.movieTypeTitleFontSize,
                color: Colors.grey,
                fontFamily: 'Play-Bold',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: UiConstants.genresGridTopPadding,
            ),
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: _genresList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (
                          context,
                        ) =>
                            GenreResults(
                          genreBox: _genresList[index],
                          genresBloc: widget.genresBloc,
                        ),
                      ),
                    );
                  },
                  child: _genresList[index],
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: UiConstants.mainAxisExtent,
                crossAxisCount: UiConstants.gridColumns,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
