

import 'package:movie_appp/pages/home_screen/model/movie_response.dart';

abstract class PopularRemoteDataSource {
  Future<MovieResponse?> getPopular(String appLanguage);
}
