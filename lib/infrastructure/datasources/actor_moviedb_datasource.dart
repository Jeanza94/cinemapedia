
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDBDatasource extends ActorsDatasource {
  
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/movie',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'ex-MX'
      }
    )
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    
    final response = await dio.get('/$movieId/credits');
    
    final credits = CreditsResponse.fromJson(response.data);
    final actors = credits.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
    
  }

}