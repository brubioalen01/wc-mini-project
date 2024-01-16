part of 'messages_bloc.dart';

@immutable
sealed class MessagesEvent {}

class InitialMessageEvent extends MessagesEvent {}

class ClickMessageEvent extends MessagesEvent {
  final MessageEntity messageEntity;

  ClickMessageEvent({required this.messageEntity});
}

class AddMessageEvent extends MessagesEvent {
  final MessageEntity messageEntity;

  AddMessageEvent({required this.messageEntity});
}

class RemoveMessageEvent extends MessagesEvent {
  final MessageEntity messageEntity;

  RemoveMessageEvent({required this.messageEntity});}

class NavigateMessageToRickyAndMortyEvent extends MessagesEvent {}
