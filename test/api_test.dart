import 'package:flutter_test/flutter_test.dart';
import 'package:movies_project/src/model/movies.dart';
import 'package:movies_project/src/resources/movies_api_provider.dart';

void main() {
  late MoviesApiProvider moviesApiProvider;
  setUp(
    () {
      moviesApiProvider = MoviesApiProvider();
    },
  );

  group(
    "Api testing",
    () {
      test(
        "Trending Movies",
        () async {
          Movies movie = await moviesApiProvider.fetchTrendingMovies();
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );

      test(
        "Discover Movies",
        () async {
          Movies movie = await moviesApiProvider.fetchDiscoverMovies();
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );

      test(
        "Movie by search",
        () async {
          Movies movie = await moviesApiProvider.searchByMovieName(
            "the",
          );
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );
    },
  );
}
