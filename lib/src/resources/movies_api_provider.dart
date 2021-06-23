import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import '../model/movies.dart';

class MoviesApiProvider {
  http.Client client = http.Client();

  Future<Movies> fetchMoviesList() async {
    final response = await client.get(
      Uri.parse(
        Constants.uriClient + Constants.apiKey,
      ),
    );
    if (response.statusCode == 200) {
      return Movies.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception(
        Constants.moviesLoadingError,
      );
    }
  }
}
