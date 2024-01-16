import 'package:flutter/material.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/character_model.dart';

class RickyandmortyTileWidget extends StatefulWidget {
  final CharacterModel? characterModel;
  const RickyandmortyTileWidget({
    super.key,
    required this.characterModel,
  });

  @override
  State<RickyandmortyTileWidget> createState() =>
      _RickyandmortyTileWidgetState();
}

class _RickyandmortyTileWidgetState extends State<RickyandmortyTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.characterModel?.name ?? ''),
        ],
      ),
    );
  }
}
