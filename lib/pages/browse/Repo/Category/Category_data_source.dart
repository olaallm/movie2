import 'package:movie_appp/pages/browse/Models/CategoryResponse.dart';

abstract class CategoryDataSource {
  Future<CategoryResponse?> getCategory(String appLanguage);
}
