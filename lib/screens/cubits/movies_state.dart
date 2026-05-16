import 'package:movie_app/domin/entities/movie_entity.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesSuccess extends MoviesState {
  final List<MovieEntity> movies;
  final List<String> genres;
  final String selectedGenre;

  MoviesSuccess({
    required this.movies,
    required this.genres,
    required this.selectedGenre,
  });
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);
}