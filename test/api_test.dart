import 'package:flutter_test/flutter_test.dart';
import 'package:movies_project/src/model/movies.dart';
import 'package:movies_project/src/resources/movies_api_provider.dart';
import 'utils/test_strings.dart';

void main() {
  late MoviesApiProvider moviesApiProvider;
  setUp(
    () {
      moviesApiProvider = MoviesApiProvider();
    },
  );

  group(
    TestStrings.apiTestGroupString,
    () {
      test(
        TestStrings.trendingMoviesTestDescription,
        () async {
          Movies movie = await moviesApiProvider.fetchTrendingMovies();
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );

      test(
        TestStrings.discoverMoviesTestDescription,
        () async {
          Movies movie = await moviesApiProvider.fetchDiscoverMovies();
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );

      test(
        TestStrings.searchMovieTestDescription,
        () async {
          Movies movie = await moviesApiProvider.searchByMovieName(
            TestStrings.defaultMovieSearch,
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
