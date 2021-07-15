import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.movieImage,
  }) : super(key: key);

  final String movieImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: UiConstants.movieDetailsAppBarExpandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          movieImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
