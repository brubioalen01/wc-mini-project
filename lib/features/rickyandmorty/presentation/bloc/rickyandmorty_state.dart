part of 'rickyandmorty_bloc.dart';

@immutable
sealed class RickyandmortyState {}

abstract class RickyandmortyActionState extends RickyandmortyState {}

final class RickyandmortyInitial extends RickyandmortyState {}

class RickyandmortyLoadingState extends RickyandmortyState {}

class RickyandmortyErrorState extends RickyandmortyState {}

class RickyandmortySuccessState extends RickyandmortyState {
  final List<CharacterModel> characters;

  RickyandmortySuccessState({required this.characters});
}

class RickyandmortyLoadMoreState extends RickyandmortyActionState {
  final int page;

  RickyandmortyLoadMoreState(this.page);
}

class RickyandmortyLoadMoreLoadingState extends RickyandmortyState {}
