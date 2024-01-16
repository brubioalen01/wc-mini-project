import 'package:wcminiproj/features/rickyandmorty/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({int? id, String? name, String? status, String? image})
      : super(id, name, status, image);

  factory CharacterModel.fromJson(Map<String, dynamic> map) {
    return CharacterModel(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        status: map['status'] ?? '',
        image: map['image'] ?? '');
  }

  factory CharacterModel.fromEntity(CharacterEntity entity) {
    return CharacterModel(
        id: entity.id,
        name: entity.name,
        status: entity.status,
        image: entity.image);
  }
}
