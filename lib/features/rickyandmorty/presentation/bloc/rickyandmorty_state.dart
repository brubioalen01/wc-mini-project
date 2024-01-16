part of 'rickyandmorty_bloc.dart';

@immutable
sealed class RickyandmortyState {}

final class RickyandmortyInitial extends RickyandmortyState {}

class RickyandmortyLoadingState extends RickyandmortyState {}

class RickyandmortyErrorState extends RickyandmortyState {}

class RickyandmortySuccessState extends RickyandmortyState {
  final ApiResponse<PaginatedCharactersModel> characters;

  RickyandmortySuccessState({required this.characters});
}
