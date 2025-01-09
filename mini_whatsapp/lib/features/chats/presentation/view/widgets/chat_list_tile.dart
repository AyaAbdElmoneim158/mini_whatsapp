import 'package:flutter/material.dart';
import '../../../data/models/chat_model.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    required this.chat,
  });

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    // Get the last message in the chat
    final lastMessage = chat.messages.isNotEmpty ? chat.messages.last : null;

    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(
        '/chatDetails',
        arguments: chat.id,
      ),
      leading: CircleAvatar(
        child: Text(
          chat.title.isNotEmpty ? chat.title[0].toUpperCase() : '?',
        ),
      ),
      title: Text(
        chat.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: lastMessage != null
          ? Text(
              "${lastMessage.senderId}: ${lastMessage.content}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : const Text(
              "No messages yet",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
      trailing: Text(
        _formatTimestamp(chat.lastUpdated),
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    if (now.difference(timestamp).inDays > 0) {
      return "${timestamp.day}/${timestamp.month}/${timestamp.year}";
    }
    return "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}";
  }
}
