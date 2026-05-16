import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domin/entities/movie_entity.dart';
import 'package:movie_app/domin/use_cases/get_movies_use_case.dart';
import 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMoviesUseCase useCase;

  MoviesCubit(this.useCase) : super(MoviesInitial());

  List<MovieEntity> _allMovies = [];
  String selectedGenre = "All";

  Future<void> getMovies() async {
    emit(MoviesLoading());

    try {
      final movies = await useCase.call();
      _allMovies = movies;

      emit(MoviesSuccess(
        movies: _allMovies,
        genres: _extractGenres(_allMovies),
        selectedGenre: selectedGenre,
      ));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

  void changeGenre(String genre) {
    selectedGenre = genre;

    emit(MoviesSuccess(
      movies: _allMovies,
      genres: _extractGenres(_allMovies),
      selectedGenre: selectedGenre,
    ));
  }

  List<String> _extractGenres(List<MovieEntity> movies) {
    final set = <String>{};

    for (final movie in movies) {
      set.addAll(movie.genres);
    }

    return set.toList();
  }

  List<MovieEntity> get filteredMovies {
    if (selectedGenre == "All") return _allMovies;

    return _allMovies
        .where((m) => m.genres.contains(selectedGenre))
        .toList();
  }
}