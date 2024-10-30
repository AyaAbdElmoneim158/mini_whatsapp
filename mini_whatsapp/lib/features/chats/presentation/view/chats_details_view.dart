import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatUser> chatUsers = _generateChatUsers();
    final List<ChatMessage> messages = _generateDummyMessages(chatUsers);

    return Scaffold(
      backgroundColor:
          const Color(0xFFECE5DD), // WhatsApp-like background color
      appBar: _buildAppBar(),
      body: _buildChatBody(messages),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Chats"),
      backgroundColor: const Color(0xFF075E54), // WhatsApp header color
    );
  }

  Widget _buildChatBody(List<ChatMessage> messages) {
    return DashChat(
      currentUser: ChatUser(id: "0"), // Set the current user ID here
      messages: messages,
      onSend: (ChatMessage message) {
        messages.insert(0, message); // Add the message to the list
      },
      messageOptions: const MessageOptions(
        currentUserContainerColor:
            Color(0xFFE2FFC7), // Green bubble for sent messages
        containerColor:
            Color(0xFFFFFFFF), // Light gray bubble for received messages
        textColor: Colors.black, // Text color for received messages
        currentUserTextColor: Colors.black, // Text color for sent messages
      ),
      inputOptions: _buildInputOptions(),
    );
  }

  InputOptions _buildInputOptions() {
    return InputOptions(
      inputDecoration: InputDecoration(
        hintText: "Type a message...",
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      inputTextStyle: const TextStyle(color: Colors.black),
    );
  }

  List<ChatUser> _generateChatUsers() {
    return [
      ChatUser(
          id: "1",
          firstName: "Brooklyn",
          lastName: "Simmons",
          profileImage:
              "https://cdn-icons-png.flaticon.com/512/4140/4140037.png"),
      ChatUser(
          id: "2",
          firstName: "Robert",
          lastName: "Fox",
          profileImage:
              "https://cdn-icons-png.flaticon.com/512/4140/4140037.png"),
      ChatUser(
          id: "3",
          firstName: "Darrell",
          lastName: "Steward",
          profileImage:
              "https://cdn-icons-png.flaticon.com/512/4140/4140037.png"),
      ChatUser(
          id: "4",
          firstName: "Ronald",
          lastName: "Richards",
          profileImage:
              "https://cdn-icons-png.flaticon.com/512/4140/4140037.png"),
      ChatUser(
          id: "5",
          firstName: "Marvin",
          lastName: "McKinney",
          profileImage:
              "https://cdn-icons-png.flaticon.com/512/4140/4140037.png"),
      ChatUser(
          id: "6",
          firstName: "Jerome",
          lastName: "Bell",
          profileImage:
              "https://cdn-icons-png.flaticon.com/512/4140/4140037.png"),
    ];
  }

  List<ChatMessage> _generateDummyMessages(List<ChatUser> chatUsers) {
    return [
      ChatMessage(
          text: "Photo",
          user: chatUsers[0],
          createdAt: DateTime.now().subtract(const Duration(minutes: 1))),
      ChatMessage(
          text: "I'll see you in a bit",
          user: chatUsers[1],
          createdAt: DateTime.now().subtract(const Duration(minutes: 2))),
      ChatMessage(
          text: "I'll see you in a bit",
          user: chatUsers[2],
          createdAt: DateTime.now().subtract(const Duration(minutes: 3))),
      ChatMessage(
          text: "I'll see you in a bit",
          user: chatUsers[3],
          createdAt: DateTime.now().subtract(const Duration(minutes: 4))),
      ChatMessage(
          text: "I'll see you in a bit",
          user: chatUsers[4],
          createdAt: DateTime.now().subtract(const Duration(minutes: 5))),
      ChatMessage(
          text: "Video",
          user: chatUsers[5],
          createdAt: DateTime.now().subtract(const Duration(minutes: 6))),
    ];
  }
}
