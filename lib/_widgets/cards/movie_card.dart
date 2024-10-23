import 'package:flutter/material.dart';
import 'package:movie_list/_widgets/shared/tag.dart';
import 'package:movie_list/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie _movie;
  const MovieCard({super.key, required Movie movie}) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, "/detailed_view", arguments: _movie),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Poster Image
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.network(
                _movie.poster,
                fit: BoxFit.cover,
                width: 120, // Consistent width
                height: 180, // Added height for better aspect ratio
              ),
            ),
            const SizedBox(width: 10),
            // Movie Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _movie.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  // Genres
                  Wrap(
                    spacing: 6.0,
                    runSpacing: 6,
                    children: _movie.genre.split(',').map((genre) {
                      return Tag(value: genre.trim());
                    }).toList(),
                  ),
                  const SizedBox(height: 13),
                  // Plot
                  Text(
                    _movie.plot,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  // Year and Rating
                  Row(
                    children: [
                      Tag(value: _movie.year),
                      const SizedBox(width: 6),
                      Tag(value: "✨  ${_movie.imdbRating}"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
