import 'package:wcminiproj/core/utils/usecase.dart';
import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';
import 'package:wcminiproj/features/messages/domain/repository/message_repository.dart';

class RemoveMessageUseCase implements UseCase<void, MessageEntity> {
  final MessagesRepository repository;

  RemoveMessageUseCase(this.repository);

  @override
  Future<void> call({MessageEntity? params}) async {
    repository.removeMessages(params);
  }
}
