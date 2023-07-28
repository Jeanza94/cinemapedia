
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'movies_providers.dart';

final moviesSlidesShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingVideos = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingVideos.isEmpty) return [];
  return nowPlayingVideos.sublist(0, 6);
});