import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';

class BrianCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: UiConstants.brianCardTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(
          UiConstants.backgroundAlphaValue,
          UiConstants.backgroundRedValue,
          UiConstants.backgroundGreenValue,
          UiConstants.backgroundBlueValue,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    UiConstants.brianImage,
                  ),
                  radius: UiConstants.radius,
                ),
                Padding(
                  padding: EdgeInsets.all(
                    UiConstants.brianCardPadding,
                  ),
                  child: Text(
                    UiConstants.developersPosition,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      backgroundColor: Colors.lightGreenAccent,
                      fontSize: UiConstants.brianPositionFontSize,
                      letterSpacing: UiConstants.brianTextsLetterSpacing,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    UiConstants.brianCardPadding,
                  ),
                  child: Text(
                    UiConstants.brianFullName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      backgroundColor: Colors.yellow,
                      fontSize: UiConstants.brianCompleteNameFontSize,
                      letterSpacing: UiConstants.brianTextsLetterSpacing,
                      color: Colors.teal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    UiConstants.brianTextsPadding,
                  ),
                  child: Text(
                    UiConstants.brianEmail,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      backgroundColor: Colors.yellow,
                      fontSize: UiConstants.brianEmailFontSize,
                      letterSpacing: UiConstants.brianTextsLetterSpacing,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
