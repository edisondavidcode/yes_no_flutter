import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_flutter/domain/entities/message.dart';
import 'package:yes_no_flutter/presentation/providers/chat_provider.dart';
import 'package:yes_no_flutter/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_flutter/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_flutter/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/92/6d/48/926d4827bc7b914de6692e8cdd9a1bec.jpg'),
            ),
          ),
          title: const Text('Mi amor ❤️')),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(
                          message: message,
                        );
                },
              ),
            ),
            //Caja de texto de mensaje
            MessageFieldBox(onValue: chatProvider.sendMessage),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
