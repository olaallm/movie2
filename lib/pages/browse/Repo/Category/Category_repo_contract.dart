import 'package:movie_appp/pages/browse/Models/CategoryResponse.dart';

abstract class CategoryRepoContract {
  Future<CategoryResponse?> getCategory(String appLanguage);
}
