import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcminiproj/core/dependency_injection/injection_container.dart';
import 'package:wcminiproj/features/rickyandmorty/presentation/bloc/rickyandmorty_bloc.dart';
import 'package:wcminiproj/features/rickyandmorty/presentation/widgets/rickyandmorty_tile_widget.dart';

class Rickyandmorty extends StatefulWidget {
  const Rickyandmorty({super.key});

  @override
  State<Rickyandmorty> createState() => _RickyandmortyState();
}

class _RickyandmortyState extends State<Rickyandmorty> {
  final RickyandmortyBloc bloc = RickyandmortyBloc(sl());

  @override
  void initState() {
    bloc.add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RickyandmortyBloc, RickyandmortyState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (RickyandmortyLoadingState):
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case const (RickyandmortySuccessState):
            final successState = state as RickyandmortySuccessState;
            return Scaffold(
              body: ListView.builder(
                  itemCount: successState.characters.data?.characters.length,
                  itemBuilder: ((context, index) {
                    return RickyandmortyTileWidget(
                      characterModel:
                          successState.characters.data?.characters[index],
                    );
                  })),
              appBar: AppBar(
                title: const Text('Characters'),
              ),
            );
          case const (RickyandmortyErrorState):
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const Placeholder();
        }
      },
    );
  }
}
