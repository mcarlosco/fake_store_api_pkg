import 'package:fake_store_api_pkg/fake_store_api_pkg.dart';
import 'package:flutter/material.dart';

import '../consts.dart';
import '../views.dart';
import '../widgets.dart';

final class DemoScreen extends StatefulWidget {
  final ProductsApi _productsApi;
  final UsersApi _usersApi;

  DemoScreen({super.key})
      : _productsApi = ProductsApi(),
        _usersApi = UsersApi();

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  ViewsConst? _view;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'API Package Demo',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                value: _view,
                hint: const Text('Views'),
                items: ViewsConst.values
                    .map((view) => DropdownMenuItem<ViewsConst>(
                          value: view,
                          child: Text(view.title),
                        ))
                    .toList(),
                onChanged: (view) {
                  setState(() {
                    _view = view;
                  });
                },
              ),
            ),
            FutureBuilder(
              future: _switchView(),
              builder: (_, snapshot) =>
                  snapshot.connectionState == ConnectionState.done
                      ? snapshot.data!
                      : const Text('Just a moment please...'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> _switchView() => switch (_view) {
        ViewsConst.categories => widget._productsApi.getCategories().then(
              (coin) => coin.flip<Widget>(
                ObjectsView.new,
                (_) => const Text('Error getting categories'),
              ),
            ),
        ViewsConst.products => widget._productsApi.getProducts().then(
              (coin) => coin.flip<Widget>(
                ObjectsView.new,
                (_) => const Text('Error getting products'),
              ),
            ),
        ViewsConst.users => widget._usersApi.getUsers().then(
              (coin) => coin.flip<Widget>(
                ObjectsView.new,
                (_) => const Text('Error getting users'),
              ),
            ),
        _ => Future.value(const Text('No view selected')),
      };
}
