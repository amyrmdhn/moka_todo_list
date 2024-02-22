import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 72, 214),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() {
  runApp(const MokaTodo());
}

class MokaTodo extends StatelessWidget {
  const MokaTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Center(
        child: Text('First Commit'),
      ),
      title: 'Miko: To-do list',
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
