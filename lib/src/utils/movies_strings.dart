abstract class MoviesStrings {
  static const String apiKey = '71e653d470212404f44ab39ffc88da9e';
  static const String trendingMoviesEndpoint =
      'https://api.themoviedb.org/3/trending/all/day?api_key=';
  static const String discoverMoviesEndpoint =
      'https://api.themoviedb.org/3/discover/movie?api_key=' +
          apiKey +
          '&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate';
  static const String imagesPath = 'https://image.tmdb.org/t/p/w185';
  static const String defaultImage =
      'https://www.lyon-ortho-clinic.com/files/cto_layout/img/placeholder/desktop_devices.jpg';
  static const String uriSearchClient =
      'https://api.themoviedb.org/3/search/movie?api_key=' + apiKey + "&query=";
  static const String inputText = 'Search for a movie...';
  static const String searchingMoviesTitle = 'Search Results';
  static const String trendingMoviesTitle = 'Trending Movies';
  static const String discoverMoviesTitle = 'Discover Movies';
  static const String defaultTitle = 'Could not find title';
  static const String defaultOverview = 'Could not find overview';
  static const String defaultReleaseDate = 'Could not find date';
  static const String defaultVoteAverage = '-';
  static const String backButtonText = "BACK";
  static const String brhokeLogo = "assets/images/brhokeLogo.png";
  static const String textStyleFontFamily = "Play-Bold";
  static const String moviesAppTitle = "Brhoke Movies App";
}
