import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: UiConstants.movieDetailsAppBarExpandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          posterPath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
