import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'states/movies_state_loading.dart';
import 'utils/ui_constants.dart';
import 'state_type.dart';
import 'states/grid_movies_state_success.dart';
import 'states/movies_state_error.dart';
import 'widgets/homeScreenWidgets/grid_movies.dart';

class GridMoviesEvents extends StatelessWidget {
  final StateType state;

  const GridMoviesEvents({
    required this.state,
  });

  Widget _buildContent(BuildContext context) {
    switch (state.stateType) {
      case MoviesStateType.loading:
        return Container(
          height: MediaQuery.of(context).size.height -
              UiConstants.swiperCardsHeight,
          child: Center(
            child: MoviesStateLoading(),
          ),
        );
      case MoviesStateType.success:
        return GridMovies(
          gridChild: GridMoviesStateSuccess(
            state: state,
          ),
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
