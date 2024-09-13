import 'package:movie_appp/pages/home_screen/model/movie_response.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse?> searchMovies(String query, String appLanguage);
}
