import 'package:flutter/material.dart';
import '../ui/movies_details_page.dart';

class MoviesInkwell extends StatelessWidget {
  final String moviePosterPath;
  final String movieOverview;
  final String movieReleaseDate;
  final String movieTitle;
  final String movieVoteAverage;

  const MoviesInkwell({
    Key? key,
    required this.moviePosterPath,
    required this.movieOverview,
    required this.movieReleaseDate,
    required this.movieTitle,
    required this.movieVoteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Image.network(
          moviePosterPath,
          fit: BoxFit.fill,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoviesDetailsPage(
                movieImage: moviePosterPath,
                overView: movieOverview,
                releaseDate: movieReleaseDate,
                title: movieTitle,
                voteAverage: movieVoteAverage,
              ),
            ),
          );
        },
      ),
    );
  }
}
