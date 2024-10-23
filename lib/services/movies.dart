import 'package:http/http.dart' as http;

class MoviesServices {
  Future<http.Response> getMovies() {
    return http.get(Uri.parse(
        "https://learn.zone01dakar.sn/git/root/public/raw/branch/master/subjects/mobile-dev/movie-list/movies.json"));
  }
}
