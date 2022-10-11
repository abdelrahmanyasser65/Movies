import 'package:first/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation{
 const RecommendationModel({
    super.image,
   required super.id});
 factory RecommendationModel.fromJson(Map<String,dynamic>json){
   return RecommendationModel(
       image: json["backdrop_path"]??"/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg",
       id: json['id']);
 }
}