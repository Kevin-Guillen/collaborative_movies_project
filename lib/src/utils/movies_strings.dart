abstract class MoviesStrings {
  static const String uri = 'https://api.themoviedb.org/3/';
  static const String apiKey = '71e653d470212404f44ab39ffc88da9e';
  static const String trendingMoviesEndpoint =
      uri + 'trending/all/day?api_key=' + apiKey;
  static const String searchMoviesEndpoint =
      uri + 'search/movie?api_key=' + apiKey + "&query=";
  static const String actionDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=28';
  static const String adventureDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=12';
  static const String comedyDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=35';
  static const String crimeDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=80';
  static const String dramaDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=18';
  static const String familyDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=10751';
  static const String fantasyDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=14';
  static const String historyDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=36';
  static const String musicDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=10402';
  static const String horrorDiscoverMoviesEndpoint =
      uri + 'discover/movie?api_key=' + apiKey + '&with_genres=27';
  static const String imagesPath = 'https://image.tmdb.org/t/p/w185';
  static const String defaultImage =
      'https://www.lyon-ortho-clinic.com/files/cto_layout/img/placeholder/desktop_devices.jpg';
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
