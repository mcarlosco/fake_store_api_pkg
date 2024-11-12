import 'package:flutter/material.dart';

final class AppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: colorScheme.inversePrimary,
        ),
      ),
      backgroundColor: colorScheme.primary,
      iconTheme: IconThemeData(
        color: colorScheme.inversePrimary,
      ),
    );
  }
}
