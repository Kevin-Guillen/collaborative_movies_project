import 'package:flutter/material.dart';
import 'package:movies_widgets/movies_project_widgets.dart';
import '../utils/ui_constants.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    Key? key,
    required this.overView,
    required this.movieImage,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
  }) : super(key: key);

  final String overView;
  final String movieImage;
  final String title;
  final String releaseDate;
  final num voteAverage;

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
              movieImage: movieImage,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: UiConstants.detailsSizeBoxHeight,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: UiConstants.widgetPadding,
                    ),
                    child: Row(
                      children: [
                        MovieDetailsImage(
                          movieImage: movieImage,
                        ),
                        Expanded(
                          child: MovieMainInfo(
                            title: title,
                            releaseDate: releaseDate,
                            voteAverage: voteAverage.toString(),
                          ),
                        )
                      ],
                    ),
                  ),
                  MovieDescription(
                    overView: overView,
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
