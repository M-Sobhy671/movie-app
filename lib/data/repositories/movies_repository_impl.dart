import 'package:movie_app/api/data_sources/movies_remote_data.dart';
import 'package:movie_app/domin/entities/movie_entity.dart';
import 'package:movie_app/domin/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource remote;

  MoviesRepositoryImpl(this.remote);

  @override
  Future<List<MovieEntity>> getMovies() async {
    final data = await remote.getMovies();

    final movies = data['data']['movies'] as List;

    return movies.map((e) {
      return MovieEntity(
        id: e['id'],
        title: e['title'],
        imageUrl: e['medium_cover_image'],
        rating: (e['rating'] ?? 0).toDouble(),
        genres: List<String>.from(e['genres'] ?? []),
      );
    }).toList();
  }
}