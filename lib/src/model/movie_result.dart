import '../utils/movie_string.dart';

class MoviesResult {
  late int id;
  late num voteAverage;
  late String title;
  late String posterPath;
  String? originalTitle;
  List<int> genreIDs;
  late bool adult;
  late String overView;
  late String releaseDate;

  MoviesResult({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterPath,
    required this.genreIDs,
    required this.overView,
    required this.releaseDate,
  });

  factory MoviesResult.fromJson(
    Map<String, dynamic> parsedJson,
  ) {
    var genreIdList = parsedJson['genre_ids'] as List;
    List<int> _genreListResult = [];
    for (int i = 0; i < genreIdList.length; i++) {
      _genreListResult.add(genreIdList[i]);
    }

    return MoviesResult(
      id: parsedJson['id'],
      voteAverage: parsedJson['vote_average'] != null
          ? parsedJson['vote_average']
          : MovieStrings.defaultVoteAverage,
      title: parsedJson['title'] != null
          ? parsedJson['title']
          : MovieStrings.defaultTitle,
      posterPath: parsedJson['poster_path'] != null
          ? MovieStrings.imagesPath + parsedJson['poster_path']
          : MovieStrings.defaultImage,
      genreIDs: _genreListResult,
      overView: parsedJson['overview'],
      releaseDate: parsedJson['release_date'] != null
          ? parsedJson['release_date']
          : MovieStrings.defaultReleaseDate,
    );
  }
}
