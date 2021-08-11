import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';
import '../utils/movie_string.dart';

class MovieDetailButton extends StatelessWidget {
  MovieDetailButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UiConstants.paddingBackButton,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => Colors.blueGrey,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                UiConstants.paddingBackButtonChildren,
              ),
              child: Icon(
                Icons.arrow_back_sharp,
                size: UiConstants.paddingBackButtonIconSize,
                color: Colors.white,
              ),
            ),
            Text(
              MovieStrings.backButtonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: UiConstants.textStyleBackButtonFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
