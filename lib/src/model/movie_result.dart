import '../utils/movie_string.dart';

class MoviesResult {
  int? voteCount;
  late int id;
  bool? video;
  double? voteAverage;
  String? title;
  double? popularity;
  String? posterPath;
  String? originalLanguage;
  String? originalTitle;
  List<int> genreIDs;
  String? backdropPath;
  bool? adult;
  String? overview;
  String? releaseDate;

  MoviesResult(
      {this.voteCount,
      required this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      required this.genreIDs,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate});

  factory MoviesResult.fromJson(
    Map<String, dynamic> parsedJson,
  ) {
    var genreIdList = parsedJson['genre_ids'] as List;
    List<int> _genreListResult = [];
    for (int i = 0; i < genreIdList.length; i++) {
      _genreListResult.add(genreIdList[i]);
    }

    return MoviesResult(
      voteCount: parsedJson['vote_count'],
      id: parsedJson['id'],
      video: parsedJson['video'],
      title: parsedJson['title'],
      popularity: parsedJson['popularity'],
      posterPath: parsedJson['poster_path'] != null
          ? MovieStrings.imagesPath + parsedJson['poster_path']
          : MovieStrings.defaultImage,
      originalLanguage: parsedJson['original_language'],
      originalTitle: parsedJson['original_title'],
      genreIDs: _genreListResult,
      backdropPath: parsedJson['backdrop_path'],
      adult: parsedJson['adult'],
      overview: parsedJson['overview'],
      releaseDate: parsedJson['release_date'],
    );
  }
}
