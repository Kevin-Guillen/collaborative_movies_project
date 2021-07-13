import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';

class PosterTitle extends StatelessWidget {
  const PosterTitle({
    Key? key,
    required this.posterPath,
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
  }) : super(key: key);

  final String posterPath;
  final int id;
  final String title;
  final String releaseDate;
  final num voteAverage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UiConstants.widgetPadding),
      child: Row(
        children: <Widget>[
          Hero(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                UiConstants.posterPathBorderRadius,
              ),
              child: Image(
                image: NetworkImage(
                  posterPath,
                ),
                height: UiConstants.posterPathHeight,
              ),
            ),
            tag: id,
          ),
          SizedBox(
            width: UiConstants.movieInfoSizeBox,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: UiConstants.movieTitleFontSize,
                  ),
                ),
                Text(
                  releaseDate,
                  style: TextStyle(
                    fontSize: UiConstants.releaseDateFontSize,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      voteAverage.toString(),
                      style: TextStyle(
                        fontSize: UiConstants.releaseDateFontSize,
                        color: Colors.amber.shade300,
                      ),
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color: Colors.amber.shade300,
                      size: UiConstants.voteAverageFontSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
