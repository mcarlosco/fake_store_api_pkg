import 'package:flutter/material.dart';

import '../widgets.dart';

final class ObjectsWidget extends StatelessWidget {
  final List<Object> objects;

  const ObjectsWidget(
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
