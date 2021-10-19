import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';

class GenreBox extends StatelessWidget {
  const GenreBox({
    required this.genreName,
    required this.gridEndpoint,
  });

  final String genreName;
  final String gridEndpoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        UiConstants.genreBoxMargin,
      ),
      padding: const EdgeInsets.all(
        UiConstants.genreBoxPadding,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
          width: UiConstants.genreBoxBordersWidth,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          genreName,
          style: TextStyle(
            fontSize: UiConstants.genreFontSize,
            color: Colors.pinkAccent,
          ),
        ),
      ),
    );
  }
}
