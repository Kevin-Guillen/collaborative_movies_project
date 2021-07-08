abstract class MovieStrings {
  static const String apiKey = '71e653d470212404f44ab39ffc88da9e';
  static const String trendingMoviesEndpoint =
      'https://api.themoviedb.org/3/trending/all/day?api_key=';
  static const String discoverMoviesEndpoint =
      'https://api.themoviedb.org/3/discover/movie?api_key=71e653d470212404f44ab39ffc88da9e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate';
  static const String moviesLoadingError = "Failed at loading the movie";
  static const String imagesPath = 'https://image.tmdb.org/t/p/w185';
  static const String defaultImage =
      'https://www.lyon-ortho-clinic.com/files/cto_layout/img/placeholder/desktop_devices.jpg';
  static const String uriSearchClient =
      'https://api.themoviedb.org/3/search/movie?api_key=' + apiKey + "&query=";
}
