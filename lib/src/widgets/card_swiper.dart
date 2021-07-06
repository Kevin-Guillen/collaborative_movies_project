import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../model/movies.dart';
import '../utils/ui_constants.dart';

class CardSwiper extends StatelessWidget {
  final Movies? trendingMovies;

  CardSwiper({required this.trendingMovies});

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: UiConstants.movieTypeTextPadding,
              ),
              child: new Text(
                'Trending Movies',
                style: TextStyle(
                  fontSize: UiConstants.movieTypeTitleFontSize,
                  color: Colors.grey,
                  fontFamily: 'Play-Bold',
                ),
              ),
            ),
          ),
          trendingMovies != null
              ? Container(
                  height: UiConstants.swiperCardsHeight,
                  child: Swiper(
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return Image.network(
                        trendingMovies!.results[index].posterPath!,
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: trendingMovies!.results.length,
                    itemWidth: UiConstants.swiperCardsWidth,
                    layout: SwiperLayout.STACK,
                  ),
                )
              : CircularProgressIndicator(
                  strokeWidth: UiConstants.progressIndicatorStrokeWidth,
                  backgroundColor: Colors.purple,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black,
                  ),
                ),
        ],
      ),
    );
  }
}
