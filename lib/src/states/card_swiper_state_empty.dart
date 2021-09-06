import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';

class CardSwiperStateEmpty extends StatelessWidget {
  const CardSwiperStateEmpty();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      UiConstants.emptySearchResult,
    );
  }
}
