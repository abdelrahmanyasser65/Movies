import 'package:first/movies/data/datasource/movie_remote_data_source.dart';
import 'package:first/movies/data/repository/movies_repository.dart';
import 'package:first/movies/domain/repository/movies_repository.dart';
import 'package:first/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:first/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:first/movies/domain/usecases/get_ppoular_movies.dart';
import 'package:first/movies/domain/usecases/get_recommendation.dart';
import 'package:first/movies/domain/usecases/get_top_rated_moves.dart';
import 'package:first/movies/presentation/controller/movie/movies_bloc.dart';
import 'package:first/movies/presentation/controller/movie_detail/movie_detail_bloc.dart';
import 'package:get_it/get_it.dart';
final sl = GetIt.instance;
class ServicesLocator{
  void init(){
   ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailBloc(sl(),sl()));

    ///User
    sl.registerLazySingleton(() =>
        GetNowPlayingMoves(sl()));
    sl.registerLazySingleton(() =>
        GetPopularMoves(sl()));
    sl.registerLazySingleton(() =>
        GetTopRatedMoves(sl()));
    sl.registerLazySingleton(() =>
        GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() =>
        GetRecommendationUseCase(sl()));


    ///Repository
    sl.registerLazySingleton<
    BaseMoviesRepository>(() =>
    MoviesRepository(sl()));

    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}