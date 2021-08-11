import 'package:flutter/material.dart';
import 'bloc/movies_bloc.dart';
import 'ui/movies_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MoviesBloc _moviesBloc = MoviesBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      home: MoviesPage(
        bloc: _moviesBloc,
      ),
    );
  }
}
