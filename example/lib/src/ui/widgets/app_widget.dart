import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens.dart';

final class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store API Package Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(1, 8, 90, 157),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: DemoScreen(),
    );
  }
}
