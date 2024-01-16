import 'package:flutter/material.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/character_model.dart';

class RickyandmortyTileGridWidget extends StatefulWidget {
  final CharacterModel? characterModel;
  const RickyandmortyTileGridWidget({
    super.key,
    required this.characterModel,
  });

  @override
  State<RickyandmortyTileGridWidget> createState() =>
      _RickyandmortyTileWidgetState();
}

class _RickyandmortyTileWidgetState extends State<RickyandmortyTileGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(8),
              width: 150,
              height: 150,
              child: Image.network(
                widget.characterModel?.image ?? '',
                fit: BoxFit.cover,
              )),
          Text(widget.characterModel?.name ?? ''),
        ],
      ),
    );
  }
}
