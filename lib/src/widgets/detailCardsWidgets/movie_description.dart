import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    Key? key,
    required this.overView,
  }) : super(key: key);

  final String overView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: UiConstants.paddingMovieDescription,
        vertical: UiConstants.paddingMovieDescription,
      ),
      child: Text(
        overView,
        style: TextStyle(
          color: Colors.white,
          fontSize: UiConstants.descriptionFontSize,
          fontFamily: 'Play-Bold',
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
