import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonCharacter {
  final int id;
  final String name;
  final int height;
  final int weight;

  PokemonCharacter({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
  });

  factory PokemonCharacter.fromJson(Map<String, dynamic> json) => _$PokemonCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonCharacterToJson(this);
}
