import 'dart:async';
import 'dart:math';
import 'package:chat/core/models/chat_massage.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService{
  static final List<ChatMassage> _msgs = [
    // ChatMassage(
    //   id: '1', 
    //   text: 'Teste primeira mensagem', 
    //   createdAt: DateTime.now(), 
    //   userId: '123', 
    //   userName: 'Una', 
    //   userImageURL: 'assets/images/avatar.png'
    // ),
    // ChatMassage(
    //   id: '2', 
    //   text: 'Olaaaa, tudo bem? ', 
    //   createdAt: DateTime.now(), 
    //   userId: '123', 
    //   userName: 'Una', 
    //   userImageURL: 'assets/images/avatar.png'
    // ),
    // ChatMassage(
    //   id: '3', 
    //   text: 'Oiii, tudo e com você?', 
    //   createdAt: DateTime.now(), 
    //   userId: '007', 
    //   userName: 'Ota', 
    //   userImageURL: 'assets/images/avatar.png'
    // ),
  ];
  static MultiStreamController<List<ChatMassage>>? _controller;
  static final _msgStrem = Stream<List<ChatMassage>>.multi((controller){
    _controller = controller; 
    _controller?.add(_msgs);
  });


  @override
  Stream<List<ChatMassage>> messagesStream() {
    return _msgStrem;
  }

  @override
  Future<ChatMassage> save(String text, ChatUser user) async {
    
    final newMessage = ChatMassage(
        id: Random().nextDouble().toString(), 
        text: text, 
        createdAt: DateTime.now(), 
        userId: user.id, 
        userName: user.name, 
        userImageURL: user.imageURL
      );
    
    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return newMessage;
  }

}