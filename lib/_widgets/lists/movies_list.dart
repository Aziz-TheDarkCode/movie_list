import 'package:flutter/material.dart';
import 'package:movie_list/_widgets/cards/movie_card.dart';
import 'package:movie_list/models/movie.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late Future<List<Movie>> movies;
  List<Movie> filteredMovies = [];
  String searchQuery = '';
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    movies = Movie.getMovies();
    _initializeMovies();
  }

  void _initializeMovies() async {
    try {
      final moviesList = await Movie.getMovies();
      setState(() {
        filteredMovies = moviesList;
      });
    } catch (e) {
      print('Error initializing movies: $e');
    }
  }

  void _filterMovies(String query) async {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        isSearching = false;
        _initializeMovies();
      } else {
        isSearching = true;
        movies.then((moviesList) {
          filteredMovies = moviesList
              .where((movie) =>
                  movie.title.toLowerCase().contains(query.toLowerCase()))
              .toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '01 Movies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search movies...',
                filled: true,
                hintStyle: const TextStyle(color: Colors.white),
                fillColor: const Color(0xFF262A34),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                _filterMovies(value);
              },
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Movie>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Failed to fetch data"));
          } else if (snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
              "No movies found",
              style: TextStyle(color: Colors.white),
            ));
          } else {
            final moviesToDisplay =
                isSearching ? filteredMovies : (snapshot.data ?? []);

            return ListView.builder(
              itemCount: moviesToDisplay.length,
              itemBuilder: (context, index) {
                Movie movie = moviesToDisplay[index];
                return MovieCard(movie: movie);
              },
            );
          }
        },
      ),
    );
  }
}
