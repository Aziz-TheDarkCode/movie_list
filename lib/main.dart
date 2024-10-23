import 'package:flutter/material.dart';
import 'package:movie_list/_widgets/lists/movies_list.dart';
import 'package:movie_list/screens/detailed_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Manrope",
        scaffoldBackgroundColor:
            const Color(0xFF181A20), // Set the background color
      ),
      home: const MovieListScreen(),
      routes: {"/detailed_view": (context) => const DetailedView()},
    );
  }
}
