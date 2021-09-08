import 'movies_result.dart';

class Movies {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<MoviesResult>? results;
  final bool error;

  Movies({
    this.error = false,
    this.page = 0,
    this.totalResults = 0,
    this.totalPages = 0,
    List<MoviesResult>? results,
  }) : results = results;

  factory Movies.fromJson(Map<String, dynamic> parsedJson) {
    var results = parsedJson['results'] as List;
    List<MoviesResult> _movieList = [];
    for (int i = 0; i < results.length; i++) {
      _movieList.add(MoviesResult.fromJson(results[i]));
    }

    return Movies(
      page: parsedJson['page'],
      totalResults: parsedJson['total_results'],
      totalPages: parsedJson['total_pages'],
      results: _movieList,
    );
  }

  bool get getError => error;
}
