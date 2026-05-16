import 'movie_model.dart';

class MoviesResponseModel {
  final List<MovieModel> movies;

  MoviesResponseModel({required this.movies});

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return MoviesResponseModel(
      movies: (json['data']['movies'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList(),
    );
  }
}