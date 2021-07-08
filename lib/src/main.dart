import 'package:flutter/material.dart';

import 'ui/movies_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      home: MoviesPage(),
    );
  }
}
