import 'package:movie_appp/pages/home_screen/model/movie_response.dart';

abstract class ReleasesRemoteDataSource {
  Future<MovieResponse?> getNewReleases(int pageNumber, String appLanguage);
}
