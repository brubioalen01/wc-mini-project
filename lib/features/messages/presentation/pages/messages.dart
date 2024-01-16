import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcminiproj/features/messages/presentation/bloc/messages_bloc.dart';
import 'package:wcminiproj/features/messages/presentation/widgets/message_add_dialog.dart';
import 'package:wcminiproj/features/messages/presentation/widgets/message_tile_widget.dart';
import 'package:wcminiproj/features/rickyandmorty/presentation/pages/rickyandmorty.dart';
import 'package:wcminiproj/core/dependency_injection/injection_container.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final messagesBloc = MessagesBloc(sl(), sl(), sl());

  @override
  void initState() {
    messagesBloc.add(InitialMessageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesBloc, MessagesState>(
      bloc: messagesBloc,
      listenWhen: (previous, current) => current is MessagesActionState,
      buildWhen: (previous, current) => current is! MessagesActionState,
      listener: (context, state) {
        if (state is MessagesNavigateToRickyAndMortyActionState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Rickyandmorty(),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (MessagesLoadingState):
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case const (MessagesSuccessState):
            final successState = state as MessagesSuccessState;
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          MessageAddDialog(messagesBloc: messagesBloc))
                },
                child: const Icon(Icons.add_circle_rounded),
              ),
              appBar: AppBar(
                title: const Text('Messages',
                    style: TextStyle(color: Colors.white)),
              ),
              body: ListView.builder(
                  itemCount: successState.messages.length,
                  itemBuilder: ((context, index) {
                    return MessageTileWidget(
                      messageEntity: successState.messages[index],
                      messagesBloc: messagesBloc,
                    );
                  })),
            );
          case const (MessagesErrorState):
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
