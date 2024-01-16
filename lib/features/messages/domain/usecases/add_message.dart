import 'package:wcminiproj/core/utils/usecase.dart';
import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';
import 'package:wcminiproj/features/messages/domain/repository/message_repository.dart';

class AddMessageUseCase implements UseCase<void, MessageEntity> {
  final MessagesRepository repository;

  AddMessageUseCase(this.repository);

  @override
  Future<void> call({MessageEntity? params}) async {
    repository.addMessages(params);
  }
}
