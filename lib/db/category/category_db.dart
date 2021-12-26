import 'package:money_manager/models/category/category_model.dart';

abstract class CategoryDbFunctions {
  // List<CategoryModel> getCategories();
  Future<void> insertCategory(CategoryModel value);
}

class CategoryDb implements CategoryDbFunctions {
  @override
  Future<void> insertCategory(CategoryModel value) async {}
  
}