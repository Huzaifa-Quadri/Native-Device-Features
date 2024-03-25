import 'package:favourite_places_app/Screens/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background :const Color.fromARGB(255, 56, 49, 66),
  );

  final theme = ThemeData().copyWith(
    useMaterial3: true, //!Depricated, applied by default
    scaffoldBackgroundColor: colorScheme.background,
    // appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    colorScheme: colorScheme,
    textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
      titleSmall : GoogleFonts.ubuntuCondensed(
        fontWeight : FontWeight.bold
      ),
      titleMedium : GoogleFonts.ubuntuCondensed(
        fontWeight : FontWeight.bold
      ),
      titleLarge : GoogleFonts.ubuntuCondensed(
        fontWeight : FontWeight.bold
      ),
    ),
  );

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places...',
      theme:theme,
      home: const Places(),
    );
  }
}

