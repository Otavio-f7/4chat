import 'dart:async';
import 'package:chat/core/models/chat_massage.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseService implements ChatService{

  @override
  Stream<List<ChatMassage>> messagesStream() {
    final store = FirebaseFirestore.instance;
    final snapshots = store.collection('chat').withConverter(
      fromFirestore: _fromFirestore, 
      toFirestore: _toFirestore,
    )
    .orderBy('createdAt', descending: true)
    .snapshots();

    return snapshots.map((snapshot){
      return snapshot.docs.map((doc){
        return doc.data();
      }).toList();
    });
    // return Stream<List<ChatMassage>>.multi((controllert){
    //   snapshots.listen((snapshot){
    //     List<ChatMassage> lista = snapshot.docs.map((doc){
    //       return doc.data();
    //     }).toList();
    //     controllert.add(lista);
    //   });
    // });
  }

  @override
  Future<ChatMassage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;
    final msg = ChatMassage(
      id: '', 
      text: text, 
      createdAt: DateTime.now(), 
      userId: user.id, 
      userName: user.name, 
      userImageURL: user.imageURL);
    final docRef = await store
        .collection('chat')
        .withConverter(
          fromFirestore: _fromFirestore, 
          toFirestore: _toFirestore
          )
          .add(msg);
    final doc = await docRef.get();
    return doc.data()!;
  }

  Map<String, dynamic> _toFirestore(ChatMassage msg, SetOptions? options){
    return{
      'text' : msg.text ,
      'createdAt' : msg.createdAt.toIso8601String(),
      'userId' : msg.userId ,
      'userName' : msg.userName ,
      'userImageURL' : msg.userImageURL,
    };
  }

  ChatMassage _fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc, 
    SnapshotOptions? options
  ){
    return ChatMassage(
      id: doc.id, 
      text: doc['text'], 
      createdAt: DateTime.parse(doc['createdAt']), 
      userId: doc['userId'], 
      userName: doc['userName'], 
      userImageURL: doc['userImageURL']
    );
  }
}