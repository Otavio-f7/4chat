import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/notification/push_notification_service.dart';
import 'package:chat/pages/auth_page.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/utils/firebase_credentials.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  Future<void> init(BuildContext context) async{
    await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //   apiKey: FirebaseCredentials.apiKey, 
      //   appId: FirebaseCredentials.appId, 
      //   messagingSenderId: FirebaseCredentials.messagingSenderId, 
      //   projectId: FirebaseCredentials.projectId
      // ),
    );
    await Provider.of<ChatNotificationService>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  init(context),
      builder: (ctx, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const LoadingPage();
        } else{
          return StreamBuilder<ChatUser?>(
            stream: AuthService().userChanges, 
            builder: (ctx, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const LoadingPage();
              } else{
                return snapshot.hasData ? const ChatPage() : const AuthPage();
              }
            }
          );
        }
      }
    );
  }
}