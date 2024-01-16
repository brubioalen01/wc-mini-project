import 'package:wcminiproj/features/messages/data/data_sources/local/message_local_source.dart';
import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';
import 'package:wcminiproj/features/messages/domain/repository/message_repository.dart';

class MessageRepositoryImpl implements MessagesRepository {
  final MessageLocalSource messageLocalSource;

  MessageRepositoryImpl({required this.messageLocalSource});

  @override
  Future<List<MessageEntity>> getAllMessages() async =>
      messageLocalSource.getAllMessages();

  @override
  Future<void> addMessages(MessageEntity? message) async =>
      messageLocalSource.addMessages(message);

  @override
  Future<void> removeMessages(MessageEntity? message) async =>
      messageLocalSource.removeMessages(message);
}
