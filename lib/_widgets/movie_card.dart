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
      child: SizedBox(
        width: 108,
        // height: 240,

        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.network(
                  _movie.poster,
                  fit: BoxFit.cover,
                  // height: 240,
                  width: 148,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _movie.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 240,
                    child: Wrap(
                      spacing: 6.0,
                      runSpacing: 6,
                      children: _movie.genre.split(',').map((genre) {
                        return Tag(value: genre.trim());
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    width: 220,
                    child: Text(_movie.plot,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Tag(value: _movie.year),
                      const SizedBox(
                        width: 6,
                      ),
                      Tag(
                        value: "✨  ${_movie.imdbRating}",
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
