import '../../../../home_screen/model/movie_response.dart';
import '../../../Api/Api_Manager.dart';
import '../Movie_data_Source.dart';

class MovieRemoteDataSourceImpl implements Online {
  ApiManager apiManager;
  MovieRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<MovieResponse?> getMovies(
      int id, int pageNumber, String appLanguage) async {
    var response = await apiManager.getMoives(id, pageNumber, appLanguage);
    return response;
  }
}

extension on ApiManager {
  getMoives(int id, int pageNumber, String appLanguage) {}
}
