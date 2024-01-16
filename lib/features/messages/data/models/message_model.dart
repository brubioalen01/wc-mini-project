import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel(
      {String? title, String? subTitle, String? description, String? date})
      : super(title, subTitle, description, date);

  factory MessageModel.fromJson(Map<String, dynamic> map) {
    return MessageModel(
        title: map['title'] ?? '',
        subTitle: map['subTitle'] ?? '',
        description: map['description'] ?? '',
        date: map['date'] ?? '');
  }

  factory MessageModel.fromEntity(MessageEntity entity) {
    return MessageModel(
        title: entity.title,
        subTitle: entity.subTitle,
        description: entity.description,
        date: entity.date);
  }
}
