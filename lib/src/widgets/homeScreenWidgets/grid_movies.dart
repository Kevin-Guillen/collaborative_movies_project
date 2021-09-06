import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';
import '../../utils/movies_strings.dart';

class GridMovies extends StatelessWidget {
  final Widget gridChild;

  GridMovies({
    required this.gridChild,
  });

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              top: UiConstants.movieTypeTextPadding,
              bottom: UiConstants.movieTypeTextPadding,
            ),
            child: const Text(
              MoviesStrings.discoverMoviesTitle,
              style: TextStyle(
                fontSize: UiConstants.movieTypeTitleFontSize,
                color: Colors.grey,
                fontFamily: 'Play-Bold',
              ),
            ),
          ),
        ),
        Container(
          child: gridChild,
        )
      ],
    );
  }
}
