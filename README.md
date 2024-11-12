# [Fake Store API](https://fakestoreapi.com/) Package

Package developed with [Dart](https://dart.dev/).

## Features

### Products API

- Get all products
- Get one product
- Get all categories

### Users API

- Get all users
- Get one user

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
