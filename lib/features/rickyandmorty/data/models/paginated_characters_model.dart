import 'package:wcminiproj/features/rickyandmorty/data/models/character_model.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/info_model.dart';

class PaginatedCharactersModel {
  final InfoModel info;
  final List<CharacterModel> characters;

  PaginatedCharactersModel(this.info, this.characters);

  factory PaginatedCharactersModel.fromJson(Map<String, dynamic> map) {
    var characters = map['results'] as List;
    return PaginatedCharactersModel(
      InfoModel.fromJson(map['info']),
      characters.map((e) => CharacterModel.fromJson(e)).toList(),
    );
  }
}
