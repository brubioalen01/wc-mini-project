part of 'rickyandmorty_bloc.dart';

@immutable
sealed class RickyandmortyEvent {}

class InitialEvent extends RickyandmortyEvent {}

class LoadMoreEvent extends RickyandmortyEvent {
  final int page;

  LoadMoreEvent(this.page);
}
