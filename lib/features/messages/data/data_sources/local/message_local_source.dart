import 'package:wcminiproj/core/constants/mock_data/messages_data.dart';
import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';

class MessageLocalSource {
  final messages = MessagesData.messages;

  Future<List<MessageEntity>> getAllMessages() async {
    return messages;
  }

  Future<void> addMessages(MessageEntity? message) async {
    if (message != null) {
      messages.insert(0, message);
    }
  }

  Future<void> removeMessages(MessageEntity? message) async {
    if (message != null) {
      messages.removeWhere((element) => element == message);
    }
  }
}
