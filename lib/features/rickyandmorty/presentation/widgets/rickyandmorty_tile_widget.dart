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
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.all(16),
              width: 50,
              height: 50,
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
