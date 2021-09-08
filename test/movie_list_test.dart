import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_project/src/bloc/movies_bloc.dart';
import 'package:movies_project/src/model/movies.dart';
import 'package:movies_project/src/resources/movies_repository.dart';
import 'package:movies_project/src/ui/movies_page.dart';
import 'package:movies_project/src/widgets/homeScreenWidgets/card_swiper.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'movie_list_test.mocks.dart';
import 'utils/test_strings.dart';

@GenerateMocks([MoviesRepository])
void main() {
  late Movies movie;
  late MoviesBloc bloc;
  late MockMoviesRepository repository;
  setUp(
    () {
      repository = MockMoviesRepository();
      movie = Movies(
        results: [],
        page: TestStrings.defaultPage,
        totalPages: TestStrings.defaultTotalPages,
        totalResults: TestStrings.defaultTotalResults, error: false,
      );
      bloc = MoviesBloc(repository);
      when(repository.fetchTrendingMovies()).thenAnswer(
        (_) async => movie,
      );
      when(repository.fetchDiscoverMovies()).thenAnswer(
        (_) async => movie,
      );
    },
  );
  group(
    TestStrings.movieListTestGroupString,
    () {
      testWidgets(
        TestStrings.movieListTestDescription,
        (WidgetTester tester) async {
          final moviesPage = MaterialApp(
            home: MoviesPage(
              bloc: bloc,
            ),
          );
          await mockNetworkImagesFor(
            () => tester.pumpWidget(
              Builder(
                builder: (BuildContext context) {
                  return moviesPage;
                },
              ),
            ),
          );
          await tester.pump();
          expect(
            find.byType(
              GridView,
            ),
            findsOneWidget,
          );
          expect(
            find.byType(
              CardSwiper,
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}
