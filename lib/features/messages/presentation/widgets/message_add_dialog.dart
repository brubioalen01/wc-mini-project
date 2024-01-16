import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:wcminiproj/features/messages/domain/entities/message_entity.dart';
import 'package:wcminiproj/features/messages/presentation/bloc/messages_bloc.dart';

class MessageAddDialog extends StatefulWidget {
  final MessagesBloc messagesBloc;
  const MessageAddDialog({super.key, required this.messagesBloc});

  @override
  State<MessageAddDialog> createState() => _MessageAddDialogState();
}

class _MessageAddDialogState extends State<MessageAddDialog> {
  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
  TextEditingController message = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    subTitle.dispose();
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              controller: title,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Sub Title',
                border: OutlineInputBorder(),
              ),
              controller: subTitle,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Messages',
                border: OutlineInputBorder(),
              ),
              controller: message,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                widget.messagesBloc.add(AddMessageEvent(
                    messageEntity: MessageEntity(
                        title.text,
                        subTitle.text,
                        message.text,
                        formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd])
                            .toString())));
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          )
        ]),
      ),
    );
  }
}
