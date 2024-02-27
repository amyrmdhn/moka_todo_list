import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


import '../screens/tabs_screen.dart';

final theme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 72, 214),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() {
  runApp(
    const ProviderScope(
      child: MokaTodo(),
    ),
  );
}

class MokaTodo extends StatelessWidget {
  const MokaTodo({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: const TabsScreen(),
      title: 'Miko: To-do list',
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
