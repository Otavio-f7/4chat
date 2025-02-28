import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String? _message = '';
  final _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;
    if(user != null && _message != null){
      await ChatService().save(_message!, user);
      _message = null;
      _messageController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
    
            controller: _messageController,
            onChanged: (msg)=> setState(() => _message = msg),
            decoration: const InputDecoration(
              hintText: 'Menssage',
              contentPadding: EdgeInsets.all(10)
    
            ),
            onSubmitted: (_){
              if(_message!.trim().isNotEmpty){
                _sendMessage();
              }
            },
          ),
        ),
        IconButton(
          onPressed: _message == null ? null : (){_sendMessage();}, 
          icon: Transform.rotate(
            angle: 100,
            child: Icon(Icons.send_rounded, size:  45, color:  _message == null ? null : Theme.of(context).primaryColor,)
          )
        ),
      ],
    );
  }
}