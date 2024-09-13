import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_appp/pages/home_screen/model/movie_response.dart';
import 'package:movie_appp/pages/search/Repositroy/movie_remote_data_source.dart';

import '../../../browse/api/api_constants.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  @override
  Future<MovieResponse?> searchMovies(String query, String appLanguage) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesApi, {
      'api_key': '2a19eceea3e415eb6ad14cea7d393928',
      'query': query,
      'language': appLanguage
    });

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return MovieResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      throw e;
    }
  }
}
