


import 'package:movie_appp/pages/home_screen/model/movie_response.dart';

abstract class PopularRepository {
  Future<MovieResponse?> getPopular(String appLanguage);
}
