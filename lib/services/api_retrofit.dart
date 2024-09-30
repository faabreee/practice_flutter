import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../clases/pokemon_model.dart';

part 'api_retrofit.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2/")
abstract class ApiRetrofit {
  factory ApiRetrofit(Dio dio, {String baseUrl}) = _ApiRetrofit;

  @GET("pokemon/{id}")
  Future<PokemonCharacter> getPokemon(@Path("id") int id);
}
