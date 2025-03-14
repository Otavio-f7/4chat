import 'package:chat/components/message_bubble.dart';
import 'package:chat/core/models/chat_massage.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});


  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<ChatMassage>>(
      stream: ChatService().messagesStream(), 
      builder: (ctx, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        } else if(!snapshot.hasData || snapshot.data!.isEmpty){
          return const Center(child: Text('Sem mensagens no chat'),);
        } else{
          final msgs = snapshot.data!.reversed.toList();
          return ListView.builder(
            reverse: true,
            itemCount: msgs.length,
            itemBuilder: (ctx, i) =>MessageBubble(
              key:  ValueKey(msgs[i].id),
              message: msgs[i], 
              belongsCurrentUser: currentUser?.id == msgs[i].userId),
          );
        }
      }
    
    );
  }
}