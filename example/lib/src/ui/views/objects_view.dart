import 'package:flutter/material.dart';

import '../widgets.dart';

final class ObjectsView extends StatelessWidget {
  final List<Object> objects;

  const ObjectsView(
    this.objects, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: objects.length,
        itemBuilder: (_, index) => CardWidget.outlined(
          supportingText: objects[index].toString(),
        ),
      ),
    );
  }
}
