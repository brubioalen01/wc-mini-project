import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';

abstract class MessagesRepository {
  Future<List<MessageEntity>> getAllMessages();

  Future<void> addMessages(MessageEntity? message);

  Future<void> removeMessages(MessageEntity? message);
}
