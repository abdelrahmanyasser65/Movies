import 'dart:async';
import 'package:first/core/usecase/base_usecase.dart';
import 'package:first/core/utils/enums.dart';
import 'package:first/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:first/movies/presentation/controller/movie/movies_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_ppoular_movies.dart';
import '../../../domain/usecases/get_top_rated_moves.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoves getNowPlayingMoves;
  final GetPopularMoves getPopularMoves;
  final GetTopRatedMoves getTopRatedMoves;

  MoviesBloc(
      this.getNowPlayingMoves, this.getTopRatedMoves, this.getPopularMoves)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoves(const NoParameters());
    result.fold(
        (l) => emit(
              state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                  nowPlayingMovies: r, nowPlayingState: RequestState.loaded),
            ));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoves(const NoParameters());
    result.fold(
        (l) => emit(
              state.copyWith(
                  topRatedState: RequestState.error,
                  topRatedMessage: l.message),
            ),
        (r) => emit(
              state.copyWith(
                  topRatedState: RequestState.loaded, topRatedMovies: r),
            ));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoves(const NoParameters());
    result.fold(
        (l) => emit(
              state.copyWith(
                  popularState: RequestState.error, popularMessage: l.message),
            ),
        (r) => emit(
              state.copyWith(
                  popularState: RequestState.loaded, popularMovies: r),
            ));
  }
}
