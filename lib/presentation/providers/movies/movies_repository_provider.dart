

import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';

//este repositorio es inmutable, es de solo lectura Provider
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});