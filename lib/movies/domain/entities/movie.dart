class Movie{
  final int id;
  final String title;
  final String image;
  final List<int>genderIds;
  final String overView;
  final double voteAverage;
  final String releaseDate;

const  Movie({
    required  this.id,
    required this.title,
    required this.image,
    required this.genderIds,
    required this.overView,
    required this.voteAverage,
  required this.releaseDate,

});
}