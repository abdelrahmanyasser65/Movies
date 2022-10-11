import 'package:dio/dio.dart';
import 'package:first/core/error/exception.dart';
import 'package:first/core/network/api_constance.dart';
import 'package:first/core/network/error_message_model.dart';
import 'package:first/core/usecase/base_usecase.dart';
import 'package:first/movies/data/models/movie_detail_model.dart';
import 'package:first/movies/data/models/movies_model.dart';
import 'package:first/movies/data/models/recommendation_model.dart';
import 'package:first/movies/domain/usecases/get_recommendation.dart';
abstract class BaseMovieRemoteDataSource{
  Future<List<MoviesModel>>getNowPlayingMovies();
  Future<List<MoviesModel>>getPopularMovies();
  Future<List<MoviesModel>>getTopRatedMovies();
  Future<MovieDetailsModel>getMoviesDetail(parameters);
  Future<List<RecommendationModel>>getRecommendation(RecommendationParameters parameters);
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MoviesModel>>getNowPlayingMovies()async{
    final response=await Dio().get(
     ApiConstance.nowPlayingMoviesPath
    );
    if(response.statusCode==200){
      return List<MoviesModel>.from((response.data["results"]as List)
      .map((e) => MoviesModel.fromJson(e)));
    }
    else{
      throw ServerException(
        errorMessageError: ErrorMessageError.formJson(response.data),
      );
    }
  }
  @override
  Future<List<MoviesModel>>getPopularMovies()async{
    final response=await Dio().get(ApiConstance.poplarMoviesPath);

    if(response.statusCode==200){
      return List<MoviesModel>.from((response.data["results"]as List)
          .map((e) => MoviesModel.fromJson(e)));
    }
    else{
      throw ServerException(
        errorMessageError: ErrorMessageError.formJson(response.data),
      );
    }
  }
  @override
  Future<List<MoviesModel>>getTopRatedMovies()async{
    final response=await Dio().get(ApiConstance.topRatedMoviesPath);
    if(response.statusCode==200){
      return List<MoviesModel>.from((response.data["results"]as List)
          .map((e) => MoviesModel.fromJson(e)));
    }
    else{
      throw ServerException(
        errorMessageError: ErrorMessageError.formJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetail(parameters) async{
    final response=await Dio().get(
        ApiConstance.movieDetailsPath(parameters)
    );
    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);
    }
    else{
      throw ServerException(
        errorMessageError: ErrorMessageError.formJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async{
    final response=await Dio().get(ApiConstance.recommendationPath(parameters.id));
    if(response.statusCode==200){
      return List<RecommendationModel>.from((response.data["results"]as List)
          .map((e) => RecommendationModel.fromJson(e)));
    }
    else{
      throw ServerException(
        errorMessageError: ErrorMessageError.formJson(response.data),
      );
    }
  }
}