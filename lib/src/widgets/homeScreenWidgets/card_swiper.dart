import 'package:flutter/material.dart';
import '../../utils/movies_strings.dart';
import '../../utils/ui_constants.dart';

class CardSwiper extends StatelessWidget {
  final bool isTextFieldEmpty;
  final Widget swiperChild;

  CardSwiper({
    required this.isTextFieldEmpty,
    required this.swiperChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: UiConstants.movieTypeTextPadding,
            ),
            child: Text(
              isTextFieldEmpty
                  ? MoviesStrings.trendingMoviesTitle
                  : MoviesStrings.searchingMoviesTitle,
              style: TextStyle(
                fontSize: UiConstants.movieTypeTitleFontSize,
                color: Colors.grey,
                fontFamily: 'Play-Bold',
              ),
            ),
          ),
          Container(
            height: UiConstants.swiperCardsHeight,
            child: swiperChild,
          )
        ],
      ),
    );
  }
}
