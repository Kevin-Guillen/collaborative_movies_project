import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';
import '../utils/movie_string.dart';

class MovieDetailButton extends StatelessWidget {
  MovieDetailButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => Color.fromARGB(
            255,
            224,
            18,
            102,
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              UiConstants.paddingBackButtonChildren,
            ),
            child: Icon(
              Icons.arrow_back_sharp,
              size: UiConstants.paddingBackButtonIconSize,
              color: Colors.black,
            ),
          ),
          Text(
            MovieStrings.backButtonText,
            style: TextStyle(
              color: Colors.black,
              fontSize: UiConstants.textStyleBackButtonFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
