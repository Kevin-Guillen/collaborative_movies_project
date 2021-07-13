import 'movie_result.dart';

class Movies {
  late final List<MoviesResult> results;

  Movies({
    required this.results,
  });

  factory Movies.fromJson(Map<String, dynamic> parsedJson) {
    var results = parsedJson['results'] as List;
    List<MoviesResult> _movieList = [];
    for (int i = 0; i < results.length; i++) {
      _movieList.add(MoviesResult.fromJson(results[i]));
    }

    return Movies(
      results: _movieList,
    );
  }
}
