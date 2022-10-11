import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:first/core/error/failure.dart';
import 'package:first/core/usecase/base_usecase.dart';
import 'package:first/movies/domain/entities/recommendation.dart';
import 'package:first/movies/domain/repository/movies_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters>{
 final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters)async {
   return await  baseMoviesRepository.getRecommendation(parameters);

  }

}
class RecommendationParameters extends Equatable{
  final int id;
  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];

}