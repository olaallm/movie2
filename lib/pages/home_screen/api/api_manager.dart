import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_appp/pages/home_screen/model/MovieVideos.dart';



import 'api_constant.dart';

class ApiManager {
/*
  https://api.themoviedb.org/3/movie/{movie_id}/videos
   */

   Future<MovieVideos?> getMovieVideos(String movieId) async {
    Uri url =Uri.https(ApiConstant.baseUrl,ApiConstant.apiName+movieId+ApiConstant.video,{
      'api_key': '8ad9e9ba188516e715696297859dfd0f',
      'language': 'en-US',
    });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return MovieVideos.fromJson(jsonDecode(response.body));
      }else {
        throw Exception(
            'Failed to load Videos : ${response.statusCode}');
      }
    }catch(e){
        rethrow;
    }
  }

}
