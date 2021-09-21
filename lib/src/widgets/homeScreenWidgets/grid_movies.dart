import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';

class GridMovies extends StatelessWidget {
  final Widget gridChild;
  final String gridTitle;

  GridMovies({
    required this.gridChild,
    required this.gridTitle,
  });

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: UiConstants.titleBottomPadding,
              ),
              child: Material(
                color: Colors.black,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.pinkAccent,
                        height: UiConstants.dividerHeight,
                        thickness: UiConstants.dividerThickness,
                      ),
                    ),
                  ),
                  Text(
                    gridTitle,
                    style: TextStyle(
                      fontSize: UiConstants.movieTypeTitleFontSize,
                      color: Colors.grey,
                      fontFamily: 'Play-Bold',
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Divider(
                        color: Colors.pinkAccent,
                        height: UiConstants.dividerHeight,
                        thickness: UiConstants.dividerThickness,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Container(
            child: gridChild,
          )
        ],
      ),
    );
  }
}
