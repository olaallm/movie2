



import 'package:movie_appp/pages/browse/Repo/Movie/Movie_data_Source.dart';
import 'package:movie_appp/pages/home_screen/api/api_manager.dart';
import 'package:movie_appp/pages/home_screen/model/movie_response.dart';

class MovieRemoteDataSourceImpl implements Online{
  ApiManager apiManager ;
MovieRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<MovieResponse?> getMovies(int id,int pageNumber ,String appLanguage) async{
    var response= await apiManager.getMoives(id, pageNumber,appLanguage);
return response;
  }





}

extension on ApiManager {
  getMoives(int id, int pageNumber, String appLanguage) {}
}