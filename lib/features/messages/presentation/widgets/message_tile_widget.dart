import 'package:flutter/material.dart';
import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';
import 'package:wcminiproj/features/messages/presentation/bloc/messages_bloc.dart';

class MessageTileWidget extends StatefulWidget {
  final MessageEntity messageEntity;
  final MessagesBloc messagesBloc;

  const MessageTileWidget({super.key, required this.messageEntity, required this.messagesBloc});

  @override
  State<MessageTileWidget> createState() => _MessageTileWidgetState();
}

class _MessageTileWidgetState extends State<MessageTileWidget> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    int? maxLines = isReadMore ? null : 4;
    TextOverflow overflow =
        isReadMore ? TextOverflow.visible : TextOverflow.ellipsis;

    return GestureDetector(
      onTap: () => setState(() {
        isReadMore = !isReadMore;
      }),
      child: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Row(
            children: [
              Text(
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  widget.messageEntity.title ?? ''),
              const SizedBox(width: 10),
              Text(
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  widget.messageEntity.date ?? ''),
            ],
          ),
          Text(
              maxLines: maxLines,
              overflow: overflow,
              widget.messageEntity.description ?? ''),
          GestureDetector(
              onTap: () {
                widget.messagesBloc
                    .add(RemoveMessageEvent(messageEntity: widget.messageEntity));
              },
              child: const Text('Delete post'))
        ]),
      ),
    );
  }
}
