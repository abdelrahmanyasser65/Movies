import 'package:dartz/dartz.dart';
import 'package:first/core/error/failure.dart';
import 'package:first/core/usecase/base_usecase.dart';
import 'package:first/movies/domain/entities/movie_detail.dart';
import 'package:first/movies/domain/repository/movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail,int>{
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(int parameters) async{
    return await baseMoviesRepository.getMovieDetails(parameters);
  }

}