import 'package:flutter_test/flutter_test.dart';
import 'package:movies_project/src/model/movies.dart';
import 'package:movies_project/src/resources/movies_api_provider.dart';
import 'package:movies_project/src/utils/tests_string.dart';

void main() {
  late MoviesApiProvider moviesApiProvider;
  setUp(
    () {
      moviesApiProvider = MoviesApiProvider();
    },
  );

  group(
    TestingStrings.apiTestGroupString,
    () {
      test(
        TestingStrings.trendingMoviesTestDescription,
        () async {
          Movies movie = await moviesApiProvider.fetchTrendingMovies();
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );

      test(
        TestingStrings.discoverMoviesTestDescription,
        () async {
          Movies movie = await moviesApiProvider.fetchDiscoverMovies();
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );

      test(
        TestingStrings.searchMovieTestDescription,
        () async {
          Movies movie = await moviesApiProvider.searchByMovieName(
            TestingStrings.defaultMovieSearch,
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
