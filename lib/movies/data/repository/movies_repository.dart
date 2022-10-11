import 'package:dartz/dartz.dart';
import 'package:first/core/error/exception.dart';
import 'package:first/core/error/failure.dart';
import 'package:first/movies/data/datasource/movie_remote_data_source.dart';
import 'package:first/movies/data/models/movies_model.dart';
import 'package:first/movies/domain/entities/movie.dart';
import 'package:first/movies/domain/entities/movie_detail.dart';
import 'package:first/movies/domain/entities/recommendation.dart';
import 'package:first/movies/domain/repository/movies_repository.dart';
import 'package:first/movies/domain/usecases/get_recommendation.dart';

class MoviesRepository extends BaseMoviesRepository{
final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies()async {
final result=await baseMovieRemoteDataSource.getNowPlayingMovies();
try{
  return Right(result);
}on ServerException catch(failure){
  return Left(ServerFailure(failure.errorMessageError.statusMessage));
}
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMoviesMovies()async {
  final result=await baseMovieRemoteDataSource.getPopularMovies();
  try{
    return Right(result);
  }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageError.statusMessage));
  }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMoviesMovies()async {
    final result=await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageError.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(parameters) async{
    final result=await baseMovieRemoteDataSource.getMoviesDetail(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageError.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters)async {
    final result=await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageError.statusMessage));
    }
  }





}