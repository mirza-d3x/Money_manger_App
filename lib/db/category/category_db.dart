// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, duplicate_ignore

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:money_manager/models/category/category_model.dart';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryID);
}

// ignore: constant_identifier_names
const CATEGORY_DB_NAME = 'category-database';

class CategoryDB implements CategoryDbFunctions {
  CategoryDB._internal();
  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryListListener =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListListener =
      ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    // add
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.put(value.id, value);
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    // display
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    // .toList() to convert to List
    return _categoryDB.values.toList();
  }

  // this fucntion written for refresh UI
  Future<void> refreshUI() async {
    final _allCategories = await getCategories();
    incomeCategoryListListener.value.clear();
    expenseCategoryListListener.value.clear();
    await Future.forEach(
      _allCategories,
      (CategoryModel category) {
        if (category.type == CategoryType.income) {
          incomeCategoryListListener.value.add(category);
        } else {
          expenseCategoryListListener.value.add(category);
        }
      },
    );

    // ignore: invalid_use_of_visible_for_testing_member
    incomeCategoryListListener.notifyListeners();
    expenseCategoryListListener.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryID) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.delete(categoryID);
    refreshUI();
  }
}
