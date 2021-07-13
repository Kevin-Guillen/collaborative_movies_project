import 'package:flutter/material.dart';
import '../../ui/movies_details_page.dart';
import '../../model/movies.dart';
import '../../utils/ui_constants.dart';
import '../../utils/movie_string.dart';

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
              MovieStrings.discoverMoviesTitle,
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
                            child: InkWell(
                              child: Image.network(
                                discoverMovies!.results[index].posterPath,
                                fit: BoxFit.fill,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailsPage(
                                      discoverMovies!.results[index],
                                    ),
                                  ),
                                );
                              },
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
