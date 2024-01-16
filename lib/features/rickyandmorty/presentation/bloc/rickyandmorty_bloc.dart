import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/character_model.dart';
import 'package:wcminiproj/features/rickyandmorty/domain/usecases/get_all_characters.dart';

part 'rickyandmorty_event.dart';
part 'rickyandmorty_state.dart';

class RickyandmortyBloc extends Bloc<RickyandmortyEvent, RickyandmortyState> {
  final GetAllCharactersUseCase getAllCharactersUseCase;
  RickyandmortyBloc(this.getAllCharactersUseCase)
      : super(RickyandmortyInitial()) {
    on<InitialEvent>(initialEvent);
    on<LoadMoreEvent>(loadMoreEvent);
  }

  FutureOr<void> initialEvent(
      InitialEvent event, Emitter<RickyandmortyState> emit) async {
    emit(RickyandmortyLoadingState());
    final characters = await getAllCharactersUseCase(params: 1);
    if (characters.error == true) {
      emit(RickyandmortyErrorState());
    } else {
      emit(RickyandmortySuccessState(
          characters: characters.data?.characters ?? List.empty()));
    }
  }

  FutureOr<void> loadMoreEvent(
      LoadMoreEvent event, Emitter<RickyandmortyState> emit) async {
    final characters = await getAllCharactersUseCase(params: event.page);
    if (characters.error == true) {
      emit(RickyandmortyErrorState());
    } else {
      emit(RickyandmortySuccessState(
          characters: characters.data?.characters ?? List.empty()));
    }
  }
}
