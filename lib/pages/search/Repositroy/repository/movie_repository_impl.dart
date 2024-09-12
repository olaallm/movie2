

import 'package:movie_appp/pages/home_screen/model/movie_response.dart';
import 'package:movie_appp/pages/search/Repositroy/movie_remote_data_source.dart';
import 'package:movie_appp/pages/search/Repositroy/movie_repository_contract.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<MovieResponse?> searchMovies(String query,String appLanguage) async {
    return await remoteDataSource.searchMovies(query,appLanguage);
  }

}

