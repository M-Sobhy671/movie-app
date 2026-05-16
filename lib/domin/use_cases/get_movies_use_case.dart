import '../entities/movie_entity.dart';
import '../repositories/movies_repository.dart';

class GetMoviesUseCase {
  final MoviesRepository repo;

  GetMoviesUseCase(this.repo);

  Future<List<MovieEntity>> call() {
    return repo.getMovies();
  }
}