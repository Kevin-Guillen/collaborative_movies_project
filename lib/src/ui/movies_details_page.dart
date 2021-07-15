import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';
import '../widgets/detailCardsWidgets/custom_appbar.dart';
import '../widgets/detailCardsWidgets/movie_description.dart';
import '../model/movie_result.dart';
import '../widgets/detailCardsWidgets/movie_main_info.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage(
    this.data, {
    Key? key,
  }) : super(key: key);

  final MoviesResult data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(
          UiConstants.bodyPadding,
        ),
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(
              movieImage: data.posterPath!,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: UiConstants.detailsSizeBoxHeight,
                  ),
                  MovieMainInfo(
                    movieImage: data.posterPath!,
                    id: data.id,
                    title: data.title,
                    releaseDate: data.releaseDate,
                    voteAverage: data.voteAverage,
                  ),
                  MovieDescription(
                    overView: data.overView!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
