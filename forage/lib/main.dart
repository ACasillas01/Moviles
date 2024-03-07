import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:forage/home_page.dart';
import 'providers/forage_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ForageProvider>(
      create: (context) => ForageProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forage',
      color: Colors.indigo,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 80, 47, 220)),
          appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 80, 47, 220),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 18)),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey.shade300,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Color.fromARGB(255, 80, 47, 220))))),
      home: const HomePage(),
    );
  }
}
