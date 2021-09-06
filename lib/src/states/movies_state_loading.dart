import 'package:flutter/material.dart';
import '../utils/colors_movies.dart';
import '../utils/ui_constants.dart';

class MoviesStateLoading extends StatelessWidget {
  const MoviesStateLoading();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: UiConstants.progressIndicatorStrokeWidth,
        backgroundColor: ColorsMovies.colorARGB,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.black,
        ),
      ),
    );
  }
}
