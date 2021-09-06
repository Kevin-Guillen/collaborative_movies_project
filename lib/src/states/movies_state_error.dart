import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';

class MoviesStateError extends StatelessWidget {
  const MoviesStateError();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          UiConstants.stateErrorL,
          UiConstants.stateErrorT,
          UiConstants.stateErrorR,
          UiConstants.stateErrorB,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: UiConstants.paddingIcon,
              ),
              child: Icon(
                Icons.signal_cellular_connected_no_internet_4_bar,
                color: Colors.grey.shade500,
                size: UiConstants.sizeIcon,
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
                children: [
                  TextSpan(
                    text: UiConstants.stateErrorText,
                    style: TextStyle(
                      fontSize: UiConstants.stateErrorStyleFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
