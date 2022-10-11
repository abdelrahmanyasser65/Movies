import 'package:first/movies/domain/entities/movie.dart';

class MoviesModel extends Movie {
  const MoviesModel(
      {required super.id,
      required super.title,
      required super.image,
      required super.genderIds,
      required super.overView,
      required super.voteAverage,
      required super.releaseDate});

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
        id: json["id"],
        title: json["title"],
        image: json["backdrop_path"],
        genderIds: List<int>.from(json["genre_ids"].map((e) => e)),
        overView: json["overview"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["release_date"]);
  }
}
