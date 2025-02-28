import 'dart:io';

import 'package:chat/core/models/chat_massage.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  static const _defaultImage = 'assets/images/avatar.png';
  const MessageBubble({
    super.key, required this.message, 
    required this.belongsCurrentUser
  });

  final ChatMassage message;
  final bool belongsCurrentUser;

  Widget _showuserImage(String imageURL){
    ImageProvider? provider;
    final uri = Uri.parse(imageURL);
    if(uri.path.contains(_defaultImage)){
      provider = const AssetImage(_defaultImage);
    } else if(uri.scheme.contains('http')){
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }
    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongsCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: belongsCurrentUser ? Theme.of(context).primaryColor.withOpacity(0.9) : Colors.blueGrey.shade200,
                borderRadius: belongsCurrentUser 
                  ? const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )
                  : const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )
              ),
              width: 180,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 43
              ),
              child: Column(
                crossAxisAlignment: belongsCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(message.userName, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: belongsCurrentUser ? Colors.white : Colors.black
                    ),
                  ),
                  Text(
                    message.text,
                    textAlign: belongsCurrentUser ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      color: belongsCurrentUser ? Colors.white : Colors.black
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: belongsCurrentUser ? null : 1,
          right: belongsCurrentUser ? 1 : null,
          child: _showuserImage(message.userImageURL),
        ),
      ],
    );
  }
}