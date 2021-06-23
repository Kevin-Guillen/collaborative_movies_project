import 'package:flutter/material.dart';
import '../bloc/movies_bloc.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MoviesBloc _moviesBloc = MoviesBloc();

  @override
  void initState() {
    super.initState();
    _moviesBloc.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
