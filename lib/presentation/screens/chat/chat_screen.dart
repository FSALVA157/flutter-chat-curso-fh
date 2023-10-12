import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/shared/message_input_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://www.onthisday.com/images/people/jennifer-aniston.jpg?w=360'),
          ),
        ),
        title: const Text('Mi Amor 💗'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final messagesProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: messagesProvider.scrollController,
                itemCount: messagesProvider.messagesList.length,
                itemBuilder: (context, index) {
                  return (messagesProvider.messagesList[index].fromWho == FromWho.hers) ? HerMesageBubble(message: messagesProvider.messagesList[index],):  MyMessageBubble(message: messagesProvider.messagesList[index],);
                },
                )
            ),
              MessageInputBox(onValue: (value) => messagesProvider.sendMessage(value)),
          ]
        ),
      ),
    );
  }
}