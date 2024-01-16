part of 'messages_bloc.dart';

@immutable
sealed class MessagesState {}

abstract class MessagesActionState extends MessagesState {}

class MessagesInitial extends MessagesState {}

class MessagesLoadingState extends MessagesState {}

class MessagesSuccessState extends MessagesState {
  final List<MessageEntity> messages;

  MessagesSuccessState({required this.messages});
}

class MessagesErrorState extends MessagesState {}

class MessagesRemoveState extends MessagesState {
  final MessageEntity messageEntity;

  MessagesRemoveState({required this.messageEntity});
}

class MessagesAddState extends MessagesActionState {}

class MessagesNavigateToRickyAndMortyActionState extends MessagesActionState {}
