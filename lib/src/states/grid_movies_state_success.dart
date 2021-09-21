import 'package:flutter/material.dart';
import '../state_type.dart';
import '../utils/ui_constants.dart';
import 'movies_inkwell.dart';

class GridMoviesStateSuccess extends StatelessWidget {
  final StateType state;

  const GridMoviesStateSuccess({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: state.movies!.results!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: UiConstants.genreResultsMainAxisExtent,
        crossAxisCount: UiConstants.gridColumns,
      ),
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return GridTile(
          child: Container(
            margin: EdgeInsets.all(
              UiConstants.genreResultGridTileMargin,
            ),
            child: Container(
              child: MoviesInkwell(
                moviePosterPath: state.movies!.results![index].posterPath!,
                movieOverview: state.movies!.results![index].overView!,
                movieTitle: state.movies!.results![index].title,
                movieReleaseDate: state.movies!.results![index].releaseDate,
                movieVoteAverage:
                    state.movies!.results![index].voteAverage.toString(),
              ),
            ),
          ),
        );
      },
    );
  }
}
