import 'package:fake_store_api_pkg/fake_store_api_pkg.dart';
import 'package:flutter/material.dart';

final class ProductsProvider extends ChangeNotifier {
  final ProductsApi _productsApi;

  List<ProductModel> _products;
  Exception? _exception;

  ProductsProvider()
      : _productsApi = ProductsApi(),
        _products = List.empty();

  List<ProductModel> get products => _products;
  Exception? get exception => _exception;

  bool get hasProducts => _products.isNotEmpty;
  bool get hasException => _exception != null;

  Future<void> getProducts() async {
    final coin = await _productsApi.getProducts();

    coin.flip<void>((products) {
      _products = products;
      _exception = null;
      notifyListeners();
    }, (exception) {
      _products = List.empty();
      _exception = exception;
      notifyListeners();
    });
  }
}
