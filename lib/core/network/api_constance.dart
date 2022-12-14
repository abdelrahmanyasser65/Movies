class ApiConstance{
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String apiKey="c3435cfe40aeb079689227d82bf921d3";
  static const String nowPlayingMoviesPath="$baseUrl/movie/now_playing/?api_key=$apiKey";
  static const String poplarMoviesPath="$baseUrl/movie/popular/?api_key=$apiKey";
  static const String topRatedMoviesPath="$baseUrl/movie/now_playing/?api_key=$apiKey";
  static const String baseImageUrl="https://image.tmdb.org/t/p/w500";
  static  String  imageUrl(String path)=>"$baseImageUrl$path";
  static String movieDetailsPath(int movieId){
    return "$baseUrl/movie/$movieId?api_key=$apiKey";
  }
  static String recommendationPath(int movieId){
    return "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
  }

}