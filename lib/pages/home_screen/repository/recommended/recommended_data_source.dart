


import 'package:movie_appp/pages/home_screen/model/movie_response.dart';

abstract class RecommendedRemoteDataSource {
  Future<MovieResponse?> getRecommended(int pageNumber,String appLanguage);
}
