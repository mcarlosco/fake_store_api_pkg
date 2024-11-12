import 'package:fake_store_api_pkg/fake_store_api_pkg.dart';
import 'package:flutter/material.dart';

final class CategoriesProvider extends ChangeNotifier {
  final ProductsApi _productsApi;

  List<CategoryModel> _categories;
  Exception? _exception;

  CategoriesProvider()
      : _productsApi = ProductsApi(),
        _categories = List.empty();

  List<CategoryModel> get categories => _categories;
  Exception? get exception => _exception;

  bool get hasCategories => _categories.isNotEmpty;
  bool get hasException => _exception != null;

  Future<void> getCategories() async {
    final coin = await _productsApi.getCategories();

    coin.flip<void>((categories) {
      _categories = categories;
      _exception = null;
      notifyListeners();
    }, (exception) {
      _categories = List.empty();
      _exception = exception;
      notifyListeners();
    });
  }
}
