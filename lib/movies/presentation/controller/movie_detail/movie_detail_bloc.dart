
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:first/core/utils/enums.dart';
import 'package:first/movies/domain/entities/movie_detail.dart';
import 'package:first/movies/domain/entities/recommendation.dart';
import 'package:first/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:first/movies/domain/usecases/get_recommendation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.getMovieDetailsUseCase,this.getRecommendationUseCase) : super(const MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailState> emit)async {
  final result= await getMovieDetailsUseCase(event.id);
  result.fold(
          (l) => emit(state.compWith(
            movieDetailsState: RequestState.error,
            message: l.message
          )),
          (r) => emit(state.compWith(
            movieDetail: r,
            movieDetailsState: RequestState.loaded
          )));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit)async {
    final result= await getRecommendationUseCase(
      RecommendationParameters(event.id)
    );
    result.fold(
            (l) => emit(state.compWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message
        )),
            (r) => emit(state.compWith(
            recommendation: r,
            recommendationState: RequestState.loaded
        )));
  }
}
