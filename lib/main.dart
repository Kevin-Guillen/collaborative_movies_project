import 'package:flutter/material.dart';
import 'src/bloc/movies_bloc.dart';
import 'src/ui/movies_page.dart';
import 'src/utils/movie_string.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MoviesBloc _moviesBloc = MoviesBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MovieStrings.moviesAppTitle,
      home: MoviesPage(
        bloc: _moviesBloc,
      ),
    );
  }
}
