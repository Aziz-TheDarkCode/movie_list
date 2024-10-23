import 'dart:convert';
import 'package:http/http.dart' as http;

class Movie {
  final String title;
  final String year;
  final String genre;
  final String imdbRating;
  final String poster;
  final String plot;
  final List<String> images;

  Movie(
      {required this.title,
      required this.year,
      required this.genre,
      required this.imdbRating,
      required this.poster,
      required this.plot,
      required this.images});

  static Future<List<Movie>> getMovies() async {
    const String jsonbinUrl =
        "https://learn.zone01dakar.sn/git/root/public/raw/branch/master/subjects/mobile-dev/movie-list/movies.json";

    final response = await http.get(Uri.parse(jsonbinUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      List<Movie> movies = jsonList
          .map((json) => Movie.fromJson(json as Map<String, dynamic>))
          .toList();

      movies.sort((a, b) {
        double ratingA =
            a.imdbRating == "N/A" ? 0.0 : double.parse(a.imdbRating);
        double ratingB =
            b.imdbRating == "N/A" ? 0.0 : double.parse(b.imdbRating);
        return ratingB.compareTo(ratingA);
      });

      return movies;
    } else {
      throw Exception("Failed to load movies");
    }
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] as String? ?? 'Untitled',
      year: json['Year'] as String? ?? 'Unknown',
      genre: json['Genre'] as String? ?? 'Unknown',
      imdbRating: json['imdbRating'] as String? ?? "N/A",
      poster: json['Poster'] as String? ?? '',
      images: (json['Images'] as List<dynamic>?)
              ?.map((image) => image as String)
              .toList() ??
          [],
      plot: json['Plot'] as String? ?? 'No plot available',
    );
  }
}
