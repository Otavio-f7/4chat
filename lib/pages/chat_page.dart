

import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/notification/push_notification_service.dart';
import 'package:chat/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text('4 Chat'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(Icons.more_vert_rounded, color: Theme.of(context).iconTheme.color,),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: const Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(width: 10),
                        Text('Sair')
                      ],
                    ),
                  ),
                )
              ], 
              onChanged: (value) {
                if(value == 'logout'){
                  AuthService().logout();
                }
              }
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    )
                  );
                }, 
                icon: const Icon(Icons.notifications)
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: Colors.red.shade300,
                  child: Text(
                    '${Provider.of<ChatNotificationService>(context, listen: false).itemsCount}',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Provider.of<ChatNotificationService>(
      //       context, 
      //       listen: false,
      //     ).add(ChatNotification(
      //       title: 'One more notification', 
      //       body: Random().nextDouble().toString())
      //     );
      //   },
      //   child: Icon(Icons.add),
      // )
    );
  }
}