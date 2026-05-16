import 'package:dio/dio.dart';
import '../../core/network/endpoints.dart';

class MoviesApiService {
  final Dio dio;

  MoviesApiService(this.dio);

  Future<Response> getMovies() async {
    return await dio.get(EndPoints.movies);
  }

  Future<Response> getMovieDetails(int id) async {
    return await dio.get(
      EndPoints.movieDetails,
      queryParameters: {'movie_id': id},
    );
  }

  Future<Response> getSuggestions(int id) async {
    return await dio.get(
      EndPoints.suggestions,
      queryParameters: {'movie_id': id},
    );
  }
}