<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

# [Fake Store API](https://fakestoreapi.com/) Package

Package developed with [Dart](https://dart.dev/).

## Features

### Products API

- [Get all products](https://github.com/mcarlosco/fake_store_api_pkg/blob/main/lib/src/apis/products_api.dart#L8)
- [Get one product](https://github.com/mcarlosco/fake_store_api_pkg/blob/main/lib/src/apis/products_api.dart#L15)
- [Get all categories](https://github.com/mcarlosco/fake_store_api_pkg/blob/main/lib/src/apis/products_api.dart#L21)

### Users API

- [Get all users](https://github.com/mcarlosco/fake_store_api_pkg/blob/main/lib/src/apis/users_api.dart#L8)
- [Get one user](https://github.com/mcarlosco/fake_store_api_pkg/blob/main/lib/src/apis/users_api.dart#L14)

## Getting started

```yaml
fake_store_api_pkg:
  git:
    url: https://github.com/mcarlosco/fake_store_api_pkg
    ref: main
```

## Usage

### Get one product

```dart
Future<void> printProductInfo(int id) async {
  final productsApi = ProductsApi();

  final coin = await productsApi.getProduct(id);

  coin.flip<void>((product) {
    print('${product.title} \$${product.price}');
  }, (_) {
    print('error getting product: $id');
  });
}
```

For more, please see this [example](https://github.com/mcarlosco/fake_store_api_pkg/tree/main/example).

## Additional information

Este repositorio es personal y resuelve la Fase 3 de la Ruta de Crecimiento Práctica del Chapter Mobile.
