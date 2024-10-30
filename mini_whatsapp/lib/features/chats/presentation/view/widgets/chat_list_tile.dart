import 'package:flutter/material.dart';

import '../../../data/models/chat_user.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    required this.chatUser,
  });

  final ChatUserModel chatUser;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed('/chatDetails'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chatUser.imageUrl),
      ),
      title: Text(chatUser.name),
      subtitle: Row(
        children: [
          if (chatUser.status.isNotEmpty)
            Icon(
              chatUser.status == "Photo" ? Icons.photo : Icons.videocam,
              size: 16,
            ),
          const SizedBox(width: 4),
          Text(chatUser.message),
        ],
      ),
      trailing: Text(chatUser.time),
    );
  }
}
