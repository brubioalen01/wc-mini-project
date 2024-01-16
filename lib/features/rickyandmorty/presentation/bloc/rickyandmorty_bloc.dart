import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wcminiproj/core/utils/api_response.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/paginated_characters_model.dart';
import 'package:wcminiproj/features/rickyandmorty/domain/usecases/get_all_characters.dart';

part 'rickyandmorty_event.dart';
part 'rickyandmorty_state.dart';

class RickyandmortyBloc extends Bloc<RickyandmortyEvent, RickyandmortyState> {
  final GetAllCharactersUseCase getAllCharactersUseCase;
  RickyandmortyBloc(this.getAllCharactersUseCase)
      : super(RickyandmortyInitial()) {
    on<InitialEvent>(initialEvent);
  }

  FutureOr<void> initialEvent(
      InitialEvent event, Emitter<RickyandmortyState> emit) async {
    emit(RickyandmortyLoadingState());
    final characters = await getAllCharactersUseCase();
    emit(RickyandmortySuccessState(characters: characters));
  }
}
