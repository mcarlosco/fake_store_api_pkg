import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers.dart';
import '../screens.dart';

final class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoriesProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: 'Fake Store API Package Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(1, 8, 90, 157),
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.lexendTextTheme(),
        ),
        home: const DemoScreen(),
      ),
    );
  }
}
