import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';
import '../providers.dart';
import '../widgets.dart';

final class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

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

                  unawaited(_readObjects());
                },
              ),
            ),
            if (_view != null)
              ObjectsWidget(_watchObjects())
            else
              const Text('No view selected'),
          ],
        ),
      ),
    );
  }

  List<Object> _watchObjects() => switch (_view!) {
        ViewsConst.products => context.watch<ProductsProvider>().products,
        ViewsConst.categories => context.watch<CategoriesProvider>().categories,
        ViewsConst.users => context.watch<UsersProvider>().users,
      };

  Future<void> _readObjects() => switch (_view!) {
        ViewsConst.products => context.read<ProductsProvider>().getProducts(),
        ViewsConst.categories =>
          context.read<CategoriesProvider>().getCategories(),
        ViewsConst.users => context.read<UsersProvider>().getUsers(),
      };
}
