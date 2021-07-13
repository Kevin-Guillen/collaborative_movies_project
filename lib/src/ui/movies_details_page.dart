import 'package:flutter/material.dart';
import '../widgets/detailCardsWidgets/custom_appbar.dart';
import '../widgets/detailCardsWidgets/movie_resume.dart';
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
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            posterPath: data.posterPath,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10.0,
                ),
                PosterTitle(
                  posterPath: data.posterPath,
                  id: data.id,
                  title: data.title,
                  releaseDate: data.releaseDate,
                  voteAverage: data.voteAverage,
                ),
                MovieDescription(overView: data.overView),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
