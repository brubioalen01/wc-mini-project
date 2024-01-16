import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcminiproj/core/dependency_injection/injection_container.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/character_model.dart';
import 'package:wcminiproj/features/rickyandmorty/presentation/bloc/rickyandmorty_bloc.dart';
import 'package:wcminiproj/features/rickyandmorty/presentation/widgets/rickyandmorty_tile_grid_widget.dart';
import 'package:wcminiproj/features/rickyandmorty/presentation/widgets/rickyandmorty_tile_widget.dart';

class Rickyandmorty extends StatefulWidget {
  const Rickyandmorty({super.key});

  @override
  State<Rickyandmorty> createState() => _RickyandmortyState();
}

class _RickyandmortyState extends State<Rickyandmorty> {
  final RickyandmortyBloc bloc = RickyandmortyBloc(sl());
  var page = 1;

  final scrollController = ScrollController();
  List<CharacterModel> characaters = [];

  void setupController(context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        bloc.add(LoadMoreEvent(page));
        page += 1;
      }
    });
  }

  @override
  void initState() {
    bloc.add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setupController(context);
    return BlocConsumer<RickyandmortyBloc, RickyandmortyState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is RickyandmortyActionState,
      buildWhen: (previous, current) => current is! RickyandmortyActionState,
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
            characaters.addAll(successState.characters);
            return Scaffold(
              body: MediaQuery.of(context).size.width <= 640
                  ? ListView.builder(
                      controller: scrollController,
                      itemCount: characaters.length,
                      itemBuilder: ((context, index) {
                        if (index >= characaters.length) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return RickyandmortyTileWidget(
                            characterModel: characaters[index],
                          );
                        }
                      }))
                  : GridView.builder(
                      controller: scrollController,
                      itemCount: characaters.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300),
                      itemBuilder: ((context, index) {
                        return RickyandmortyTileGridWidget(
                          characterModel: characaters[index],
                        );
                      })),
              appBar: AppBar(
                backgroundColor: Colors.greenAccent,
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
            return const Scaffold();
        }
      },
    );
  }
}
