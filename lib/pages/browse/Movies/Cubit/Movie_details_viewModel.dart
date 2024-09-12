


// import 'package:bloc/bloc.dart';
// import 'package:movie_appp/pages/browse/api/api_manager.dart';
// import 'package:movie_appp/pages/home_screen/model/movie_response.dart';
//
//
//
// import '../../Repo/Movie/Data_Source/Movie_remote_data_source.dart';
// import '../../Repo/Movie/Movie_data_Source.dart';
// import '../../Repo/Movie/Movie_repository_Contract.dart';
// import '../../Repo/Movie/Repository/Movie_repo_impl.dart';
// import 'MovieState.dart';
//
//
// class MovieDetailsVeiwmodel extends Cubit<Moviestate>{
//   late MovieRepositoryContract movie;
//   late Online movieSource;
//   late ApiManager apiManager;
//   MovieDetailsVeiwmodel():super(LoadingMovieState()){
//     apiManager=ApiManager();
//     movieSource=MovieRemoteDataSourceImpl(apiManager: apiManager) as Online;
//    movie=MovieRepoImpl(remote:movieSource );
//
//
//
//   }
//   int pageNumber=1;
//   List<Movie> list=[];
//
//   void getMoives(int id,String appLanguage,{bool fromPagination=false} )async {
//     if(fromPagination){
//       emit(PaginationMovieState());
//     }else{
//       emit(LoadingMovieState());
//     }
//     try {
//       var response = await movie.getMovies(id,pageNumber,appLanguage);
//       if (response!.results!.isEmpty) {
//         emit(ErrorMovieState(errorMessage: "error List is empty "));
//       }
//       else {
//         if(response.results!.isNotEmpty){
//           pageNumber++;
//           list.addAll(response.results??[]);
//         }
//         emit(SuccessMovieState(movieList: list));
//       }
//     }
//     catch (e) {
//       emit(ErrorMovieState(errorMessage: e.toString()));
//     }
//   }
//   }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_appp/pages/browse/Repo/Movie/Movie_data_Source.dart';

import '../../../home_screen/model/movie_response.dart';
import '../../../search/Repositroy/data_Source/movie_Remote_data_source_impl.dart';
import '../../Api/Api_Manager.dart';
import '../../Repo/Movie/Movie_repository_Contract.dart';
import '../../Repo/Movie/Repository/Movie_repo_impl.dart';
import 'MovieState.dart';

class MovieDetailsViewModel extends Cubit<Moviestate> {
  late final MovieRepositoryContract movie;
  late final Online movieSource;
  late final ApiManager apiManager;
  int pageNumber = 1;
  List<Movie> list = [];

  MovieDetailsViewModel() : super(LoadingMovieState()) {
    apiManager = ApiManager();
    movieSource = MovieRemoteDataSourceImpl(apiManager: apiManager) as Online;
    movie = MovieRepoImpl(remote: movieSource);
  }

  void getMovies(int id, String appLanguage, {bool fromPagination = false}) async {
    if (fromPagination) {
      emit(PaginationMovieState());
    } else {
      emit(LoadingMovieState());
    }

    try {
      final response = await movie.getMovies(id, pageNumber, appLanguage);
      if (response == null || response.results == null || response.results!.isEmpty) {
        emit(ErrorMovieState(errorMessage: "Error: Movie list is empty"));
      } else {
        if (response.results!.isNotEmpty) {
          pageNumber++;
          list.addAll(response.results!);
        }
        emit(SuccessMovieState(movieList: list));
      }
    } catch (e) {
      emit(ErrorMovieState(errorMessage: 'Error: ${e.toString()}'));
    }
  }
}
