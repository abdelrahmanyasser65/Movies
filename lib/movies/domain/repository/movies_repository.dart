import 'package:dartz/dartz.dart';
import 'package:first/movies/domain/entities/movie.dart';
import 'package:first/movies/domain/entities/movie_detail.dart';
import 'package:first/movies/domain/entities/recommendation.dart';
import 'package:first/movies/domain/usecases/get_recommendation.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{
 Future<Either<Failure,List<Movie>>>getNowPlayingMovies();
 Future<Either<Failure,List<Movie>>>getPopularMoviesMovies();
 Future<Either<Failure,List<Movie>>>getTopRatedMoviesMovies();
 Future<Either<Failure,MovieDetail>>getMovieDetails(parameters);
 Future<Either<Failure,List<Recommendation>>>getRecommendation(
     RecommendationParameters parameters
     );


}