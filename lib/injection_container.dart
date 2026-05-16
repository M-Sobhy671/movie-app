import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/network/dio_factory.dart';
import 'package:movie_app/api/services/movies_api_service.dart';
import 'package:movie_app/api/data_sources/movies_remote_data.dart';
import 'package:movie_app/domin/repositories/movies_repository.dart';
import 'package:movie_app/data/repositories/movies_repository_impl.dart';
import 'package:movie_app/domin/use_cases/get_movies_use_case.dart';
import 'package:movie_app/screens/cubits/movies_cubit.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<Dio>(() => DioFactory.getDio());

  sl.registerLazySingleton<MoviesApiService>(
    () => MoviesApiService(sl()),
  );

  sl.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSource(sl()),
  );

  sl.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetMoviesUseCase>(
    () => GetMoviesUseCase(sl()),
  );

  sl.registerFactory<MoviesCubit>(
    () => MoviesCubit(sl()),
  );
}