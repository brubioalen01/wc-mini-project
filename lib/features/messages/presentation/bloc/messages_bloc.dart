import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';
import 'package:wcminiproj/features/messages/domain/usecases/add_message.dart';
import 'package:wcminiproj/features/messages/domain/usecases/get_all_messages.dart';
import 'package:wcminiproj/features/messages/domain/usecases/remove_message.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final AddMessageUseCase addMessageUseCase;
  final GetAllMessagesUseCase getAllMessagesUseCase;
  final RemoveMessageUseCase removeMessageUseCase;
  MessagesBloc(this.addMessageUseCase, this.getAllMessagesUseCase,
      this.removeMessageUseCase)
      : super(MessagesInitial()) {
    on<InitialMessageEvent>(initialMessageEvent);
    on<RemoveMessageEvent>(removeMessageEvent);
    on<AddMessageEvent>(addMessageEvent);
    on<NavigateMessageToRickyAndMortyEvent>(
        navigateMessageToRickyAndMortyEvent);
  }

  FutureOr<void> navigateMessageToRickyAndMortyEvent(
      NavigateMessageToRickyAndMortyEvent event, Emitter<MessagesState> emit) {
    emit(MessagesNavigateToRickyAndMortyActionState());
  }

  FutureOr<void> initialMessageEvent(
      InitialMessageEvent event, Emitter<MessagesState> emit) async {
    emit(MessagesLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(MessagesSuccessState(messages: await getAllMessagesUseCase()));
  }

  FutureOr<void> removeMessageEvent(
      RemoveMessageEvent event, Emitter<MessagesState> emit) async {
    emit(MessagesLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    removeMessageUseCase(params: event.messageEntity);
    emit(MessagesSuccessState(messages: await getAllMessagesUseCase()));
  }

  FutureOr<void> addMessageEvent(
      AddMessageEvent event, Emitter<MessagesState> emit) async {
    emit(MessagesLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    addMessageUseCase(params: event.messageEntity);
    emit(MessagesSuccessState(messages: await getAllMessagesUseCase()));
  }
}
