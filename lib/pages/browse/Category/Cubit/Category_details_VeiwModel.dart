import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_appp/pages/browse/Category/Cubit/CategoryState.dart';
import 'package:movie_appp/pages/browse/Repo/Category/Category_data_source.dart';
import 'package:movie_appp/pages/browse/Repo/Category/Category_repo_contract.dart';
import 'package:movie_appp/pages/browse/Repo/Category/repo/category_repository_impl.dart';
import 'package:movie_appp/pages/browse/api/api_manager.dart';
import '../../CategoryPhoto.dart';
import '../../Repo/Category/data_source/category_data_source_impl.dart';

class CategoryDetailsViewModel extends Cubit<Categorystate> {
  late final CategoryRepoContract repository;
  late final CategoryDataSource dataSource;
  late final ApiManager apiManager;

  CategoryDetailsViewModel() : super(LoadingCategoryState()) {
    apiManager = ApiManager();
    dataSource = CategoryDataSourceImpl(apiManager: apiManager);
    repository = CategoryRepositoryImpl(remote: dataSource);
  }

  void getCategory(String appLanguage) async {
    try {
      final response = await repository.getCategory(appLanguage);
      if (response == null ||
          response.genres == null ||
          response.genres!.isEmpty) {
        emit(ErrorCategoryState(ErrorMessage: "Error: Category list is empty"));
      } else {
        final list = Category.getCategory();
        for (int i = 0; i < response.genres!.length && i < list.length; i++) {
          list[i].id = response.genres![i].id ?? 0;
          list[i].name = response.genres![i].name ?? 'Unknown';
          print('ID: ${list[i].id}');
          print('Name: ${list[i].name}');
        }
        emit(SuccessCategoryState(categoryList: list));
      }
    } catch (e) {
      emit(ErrorCategoryState(ErrorMessage: 'Error: ${e.toString()}'));
    }
  }
}
