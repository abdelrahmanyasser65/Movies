import 'package:first/movies/domain/entities/genres.dart';
import 'package:first/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  MovieDetailsModel(
      {required super.image,
      required super.id,
      required super.overView,
      required super.releaseDate,
      required super.runTime,
      required super.title,
      required super.voteAverage,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        image: json["backdrop_path"],
        id: json["id"],
        overView: json["overview"],
        releaseDate: json["release_date"],
        runTime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        genres: List<GenresModel>.from(
            json["genres"].map((e) => GenresModel.fromJson(e))));
  }
}

class GenresModel extends Genres {
  GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(name: json["name"], id: json["id"]);
  }
}
