import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';
import '../widgets/global_back_button.dart';
import '../bloc/i_movies_bloc.dart';
import '../model/movies.dart';
import '../widgets/homeScreenWidgets/genre_box.dart';
import '../events.dart';
import '../grid_movies_events.dart';
import '../state_type.dart';

class GenreResults extends StatefulWidget {
  final IMoviesBloc genresBloc;
  final GenreBox genreBox;

  const GenreResults({required this.genresBloc, required this.genreBox});

  @override
  _GenreResultsState createState() => _GenreResultsState();
}

class _GenreResultsState extends State<GenreResults> {
  @override
  void initState() {
    super.initState();
    widget.genresBloc.getMoviesState(
      Events.fetchDiscoverMovies,
      widget.genreBox.gridEndpoint,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: StreamBuilder<StateType>(
          initialData: _getInitialData(),
          stream: widget.genresBloc.gridMoviesStream,
          builder: (context, AsyncSnapshot<StateType> snapshot) {
            return snapshot.hasData
                ? GridMoviesEvents(
                    state: snapshot.data!,
                    gridTitle: widget.genreBox.genreName,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          UiConstants.paddingBackButton,
        ),
        child: GlobalBackButton(),
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
