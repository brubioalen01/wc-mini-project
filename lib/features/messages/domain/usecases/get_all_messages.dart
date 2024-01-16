import 'package:wcminiproj/core/utils/usecase.dart';
import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';
import 'package:wcminiproj/features/messages/domain/repository/message_repository.dart';

class GetAllMessagesUseCase implements UseCase<List<MessageEntity>, void> {
  final MessagesRepository repository;

  GetAllMessagesUseCase(this.repository);

  @override
  Future<List<MessageEntity>> call({void params}) {
    return repository.getAllMessages();
  }
}
