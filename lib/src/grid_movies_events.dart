import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'states/movies_state_loading.dart';
import 'state_type.dart';
import 'states/grid_movies_state_success.dart';
import 'states/movies_state_error.dart';
import 'widgets/homeScreenWidgets/grid_movies.dart';

class GridMoviesEvents extends StatelessWidget {
  final StateType state;
  final String gridTitle;

  const GridMoviesEvents({
    required this.state,
    required this.gridTitle,
  });

  Widget _buildContent(BuildContext context) {
    switch (state.stateType) {
      case MoviesStateType.loading:
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: MoviesStateLoading(),
          ),
        );
      case MoviesStateType.success:
        return GridMovies(
          gridChild: GridMoviesStateSuccess(
            state: state,
          ),
          gridTitle: gridTitle,
        );
      case MoviesStateType.error:
        return MoviesStateError();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }
}
