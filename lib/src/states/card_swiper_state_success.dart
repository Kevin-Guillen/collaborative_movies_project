import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../state_type.dart';
import '../utils/colors_movies.dart';
import '../utils/ui_constants.dart';
import 'movies_inkwell.dart';

class CardSwiperStateSuccess extends StatelessWidget {
  final StateType state;

  const CardSwiperStateSuccess({required this.state});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return MoviesInkwell(
          moviePosterPath: state.movies!.results![index].posterPath!,
          movieOverview: state.movies!.results![index].overView!,
          movieTitle: state.movies!.results![index].title,
          movieReleaseDate: state.movies!.results![index].releaseDate,
          movieVoteAverage:
              state.movies!.results![index].voteAverage.toString(),
        );
      },
      control: SwiperControl(
        color: ColorsMovies.colorARGB,
      ),
      itemCount: state.movies!.results!.length,
      itemWidth: UiConstants.swiperCardsWidth,
      layout: SwiperLayout.STACK,
    );
  }
}
