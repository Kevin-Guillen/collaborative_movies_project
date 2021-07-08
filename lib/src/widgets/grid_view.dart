import 'package:flutter/material.dart';
import '../model/movies.dart';
import '../utils/ui_constants.dart';

class GridMovies extends StatelessWidget {
  final Movies? discoverMovies;

  GridMovies({required this.discoverMovies});

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
            child: Text(
              'Discover movies',
              style: TextStyle(
                fontSize: UiConstants.movieTypeTitleFontSize,
                color: Colors.grey,
                fontFamily: 'Play-Bold',
              ),
            ),
          ),
        ),
        discoverMovies != null
            ? Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: discoverMovies!.results.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: UiConstants.mainAxisExtent,
                    crossAxisCount: UiConstants.gridColumns,
                  ),
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return GridTile(
                      child: Container(
                        margin: EdgeInsets.all(
                          UiConstants.gridTileMargin,
                        ),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                UiConstants.gridCardsBorderRadius,
                              ),
                              bottomRight: Radius.circular(
                                UiConstants.gridCardsBorderRadius,
                              ),
                            ),
                            child: Image.network(
                              discoverMovies!.results[index].posterPath!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
    );
  }
}
