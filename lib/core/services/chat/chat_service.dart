import 'package:chat/core/models/chat_massage.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_mock_service.dart';

abstract class ChatService{

  Stream<List<ChatMassage>> messagesStream();
  Future<ChatMassage?> save(String text, ChatUser user);

  factory ChatService(){
    return ChatMockService();
  }
}