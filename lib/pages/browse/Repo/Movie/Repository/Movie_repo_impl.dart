
import 'package:movie_appp/pages/browse/Repo/Movie/Movie_data_Source.dart';
import 'package:movie_appp/pages/home_screen/model/movie_response.dart';


import '../Movie_repository_Contract.dart';

class MovieRepoImpl implements MovieRepositoryContract{
  Online remote ;
  MovieRepoImpl({ required this.remote});
  @override
  Future<MovieResponse?> getMovies(int id, int pageNumber,String appLanguage) {
return remote.getMovies(id, pageNumber,appLanguage);
  }








}