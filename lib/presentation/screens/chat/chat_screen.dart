import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_buble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_buble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

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
                'https://i.pinimg.com/736x/f5/f6/22/f5f622d3a20d612bc033fbff8622d523.jpg'),
          ),
        ),
        title: const Text('Mi Amorcito <3'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //instancia de chat provider para escuchar cambios
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return message.fromWho == FromWho.her
                    ? HerMessageBuble(message:message)
                    : MyMessageBuble(message: message);
              },
            )),
            // ignore: prefer_const_constructors
            //caja de texto del chat
            MessageFieldBox(
              //onValue: (value) => chatProvider.sendMessage(value),
              //se usa cuando la funcion recibe la misma cantidad de parámetros
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
