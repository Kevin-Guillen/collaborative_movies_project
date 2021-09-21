import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/movies.dart';
import '../utils/movies_strings.dart';

class MoviesApiProvider {
  http.Client client = http.Client();

  Future<Movies> fetchTrendingMovies() async {
    try {
      final trendingResponse = await client.get(
        Uri.parse(
          MoviesStrings.trendingMoviesEndpoint,
        ),
      );
      if (trendingResponse.statusCode == 200) {
        return Movies.fromJson(
          json.decode(
            trendingResponse.body,
          ),
        );
      } else {
        return Movies(error: true);
      }
    } catch (e) {
      return Movies(error: true);
    }
  }

  Future<Movies> fetchDiscoverMovies(String movieName) async {
    try {
      final discoverResponse = await client.get(
        Uri.parse(
          movieName,
        ),
      );
      if (discoverResponse.statusCode == 200) {
        return Movies.fromJson(
          json.decode(
            discoverResponse.body,
          ),
        );
      } else {
        return Movies(error: true);
      }
    } catch (e) {
      return Movies(error: true);
    }
  }

  Future<Movies> searchByMovieName(String movieName) async {
    try {
      final searchResponse = await client.get(
        Uri.parse(
          MoviesStrings.searchMoviesEndpoint + movieName,
        ),
      );
      if (searchResponse.statusCode == 200) {
        return Movies.fromJson(
          json.decode(
            searchResponse.body,
          ),
        );
      } else {
        return Movies(error: true);
      }
    } catch (e) {
      return Movies(error: true);
    }
  }
}
