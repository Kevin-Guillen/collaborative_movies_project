import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_project/src/utils/movie_string.dart';

import '../model/movies.dart';

class MoviesApiProvider {
  http.Client client = http.Client();

  Future<Movies> fetchTrendingMovies() async {
    final trendingResponse = await client.get(
      Uri.parse(
        MovieStrings.trendingMoviesEndpoint + MovieStrings.apiKey,
      ),
    );
    if (trendingResponse.statusCode == 200) {
      return Movies.fromJson(
        json.decode(
          trendingResponse.body,
        ),
      );
    } else {
      throw Exception(
        MovieStrings.moviesLoadingError,
      );
    }
  }

  Future<Movies> fetchDiscoverMovies() async {
    final discoverResponse = await client.get(
      Uri.parse(
        MovieStrings.discoverMoviesEndpoint,
      ),
    );
    if (discoverResponse.statusCode == 200) {
      return Movies.fromJson(
        json.decode(
          discoverResponse.body,
        ),
      );
    } else {
      throw Exception(
        MovieStrings.moviesLoadingError,
      );
    }
  }
}
