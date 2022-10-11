import 'genres.dart';

class MovieDetail {
  final String image;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;
  final List<Genres>genres;

 const MovieDetail(
      {required this.image,
      required this.id,
      required this.overView,
      required this.releaseDate,
      required this.runTime,
      required this.title,
      required this.voteAverage,
      required this.genres
      });
}
