part of 'movie_detail_bloc.dart';

 class MovieDetailState extends Equatable {

  final MovieDetail ?movieDetail;
  final RequestState movieDetailsState;
  final String message;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

const  MovieDetailState({
      this.movieDetail,
      this.movieDetailsState=RequestState.loading,
      this.message='',
  this.recommendation=const [],
  this.recommendationMessage='',
  this.recommendationState=RequestState.loading
});
  MovieDetailState compWith({
   MovieDetail ?movieDetail,
    RequestState ?movieDetailsState,
    String?message,
     List<Recommendation> ?recommendation,
     RequestState ?recommendationState,
     String ?recommendationMessage,

 }){
  return MovieDetailState(
    movieDetail: movieDetail??this.movieDetail,
    movieDetailsState: movieDetailsState??this.movieDetailsState,
    message: message??this.message,
    recommendation: recommendation??this.recommendation,
    recommendationState: recommendationState??this.recommendationState,
    recommendationMessage: recommendationMessage??this.recommendationMessage
  );
}
  @override
  List<Object?> get props =>[
    movieDetail,
    movieDetailsState,
    message,
    recommendationMessage,
    recommendation,
    recommendationState
  ];

}


