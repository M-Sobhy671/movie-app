import '../services/movies_api_service.dart';

class MoviesRemoteDataSource {
  final MoviesApiService api;

  MoviesRemoteDataSource(this.api);

  Future<dynamic> getMovies() async {
    final response = await api.getMovies();
    return response.data;
  }
}