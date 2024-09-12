

//
// import '../../../Api/Api_Manager.dart';
// import '../../../Models/CategoryResponse.dart';
// import '../Category_data_source.dart';
// import 'package:movie_appp/pages/browse/Repo/Category/Category_repo_contract.dart';
//
// class CategoryDataSourceImpl implements CategoryDataSource{
//   ApiManager apiManager;
//   CategoryDataSourceImpl({required this.apiManager});
//
//   @override
//   Future<CategoryResponse?> getCategory(String appLanguage)async {
//     var response= await  apiManager.getCategory(appLanguage);
//     return response;
//   }
//
//
// }
import 'package:movie_appp/pages/browse/api/api_manager.dart';
import 'package:movie_appp/pages/browse/Repo/Category/Category_data_source.dart';


import '../../../Models/CategoryResponse.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  final ApiManager apiManager;

  CategoryDataSourceImpl({required this.apiManager});

  @override
  Future<CategoryResponse?> getCategory(String appLanguage) async {
    try {
      final response = await apiManager.getCategory(appLanguage);
      return response;
    } catch (e) {
      throw Exception('Error fetching category data: $e');
    }
  }
}
