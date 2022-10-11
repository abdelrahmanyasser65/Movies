import 'package:dartz/dartz.dart';
import 'package:first/core/usecase/base_usecase.dart';
import 'package:first/movies/domain/entities/movie.dart';
import 'package:first/movies/domain/repository/movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoves extends BaseUseCase<List<Movie>,NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoves(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
