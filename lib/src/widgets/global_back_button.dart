import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';
import '../utils/movies_strings.dart';
import '../utils/colors_movies.dart';

class GlobalBackButton extends StatelessWidget {
  GlobalBackButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => ColorsMovies.colorARGB,
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
            MoviesStrings.backButtonText,
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
