import '../utils/movies_strings.dart';

class MoviesResult {
  int id;
  num voteAverage;
  String title;
  String releaseDate;
  String? posterPath;
  String? overView;
  List<int> genreIDs;
  int voteCount;
  bool video;
  num popularity;
  String originalLanguage;
  String? backdropPath;
  bool adult;

  MoviesResult({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.releaseDate,
    this.posterPath,
    this.overView,
    required this.genreIDs,
    required this.voteCount,
    required this.video,
    required this.popularity,
    required this.originalLanguage,
    this.backdropPath,
    required this.adult,
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
      voteAverage:
          parsedJson['vote_average'] ?? MoviesStrings.defaultVoteAverage,
      title: parsedJson['title'] ?? MoviesStrings.defaultTitle,
      posterPath: parsedJson['poster_path'] != null
          ? MoviesStrings.imagesPath + parsedJson['poster_path']
          : MoviesStrings.defaultImage,
      overView: parsedJson['overview'] ?? MoviesStrings.defaultOverview,
      releaseDate:
          parsedJson['release_date'] ?? MoviesStrings.defaultReleaseDate,
      genreIDs: _genreListResult,
      voteCount: parsedJson['vote_count'],
      video: parsedJson['video'] ?? false,
      popularity: parsedJson['popularity'],
      originalLanguage: parsedJson['original_language'],
      backdropPath: parsedJson['backdrop_path'],
      adult: parsedJson['adult'] ?? false,
    );
  }
}
