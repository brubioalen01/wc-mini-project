import 'package:get_it/get_it.dart';
import 'package:wcminiproj/features/messages/data/data_sources/local/message_local_source.dart';
import 'package:wcminiproj/features/messages/data/repository_impl/message_repository_impl.dart';
import 'package:wcminiproj/features/messages/domain/repository/message_repository.dart';
import 'package:wcminiproj/features/messages/domain/usecases/add_message.dart';
import 'package:wcminiproj/features/messages/domain/usecases/get_all_messages.dart';
import 'package:wcminiproj/features/messages/domain/usecases/remove_message.dart';
import 'package:wcminiproj/features/messages/presentation/bloc/messages_bloc.dart';
import 'package:wcminiproj/features/rickyandmorty/data/data_sources/remote/rickyandmorty_api_service.dart';
import 'package:wcminiproj/features/rickyandmorty/data/repository_impl/rickyandmorty_repository_impl.dart';
import 'package:wcminiproj/features/rickyandmorty/domain/repository/rickyandmorty_repository.dart';
import 'package:wcminiproj/features/rickyandmorty/domain/usecases/get_all_characters.dart';
import 'package:wcminiproj/features/rickyandmorty/presentation/bloc/rickyandmorty_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // data source
  sl.registerSingleton<RickyandmortyApiService>(RickyandmortyApiService());
  sl.registerSingleton<MessageLocalSource>(MessageLocalSource());

  // repo
  sl.registerSingleton<MessagesRepository>(
      MessageRepositoryImpl(messageLocalSource: sl()));
  sl.registerSingleton<RickyandmortyRepository>(
      RickyandmortyRepositoryImpl(sl()));

  // usecases
  sl.registerSingleton<AddMessageUseCase>(AddMessageUseCase(sl()));
  sl.registerSingleton<GetAllMessagesUseCase>(GetAllMessagesUseCase(sl()));
  sl.registerSingleton<RemoveMessageUseCase>(RemoveMessageUseCase(sl()));
  sl.registerSingleton<GetAllCharactersUseCase>(GetAllCharactersUseCase(sl()));

  //bloc
  sl.registerFactory<MessagesBloc>(() => MessagesBloc(sl(), sl(), sl()));
  sl.registerFactory<RickyandmortyBloc>(() => RickyandmortyBloc(sl()));
}
