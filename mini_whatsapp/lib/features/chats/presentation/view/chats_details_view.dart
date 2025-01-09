import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import '../view_model/chat_cubit.dart';

class ChatDetailsView extends StatelessWidget {
  final String chatId;

  const ChatDetailsView({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE5DD),
      appBar: _buildAppBar(),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is ChatMessageError) {
            _showErrorSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is ChatLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChatLoaded) {
            return _buildChatBody(context, state.chats.cast<ChatMessage>());
          }
          return const Center(child: Text("Start chatting!"));
        },
      ),
    );
  }

  // Builds the AppBar widget
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Chats"),
      backgroundColor: const Color(0xFF075E54), // WhatsApp header color
    );
  }

  // Builds the chat body with messages
  Widget _buildChatBody(BuildContext context, List<ChatMessage> messages) {
    return DashChat(
      currentUser: ChatUser(id: "0"),
      messages: messages,
      onSend: (ChatMessage message) {
        _sendMessage(context, message);
      },
      messageOptions: const MessageOptions(
        currentUserContainerColor: Color(0xFFE2FFC7), // Green bubble for sent messages
        containerColor: Color(0xFFFFFFFF), // Light gray bubble for received messages
        textColor: Colors.black, // Text color for received messages
        currentUserTextColor: Colors.black, // Text color for sent messages
      ),
      inputOptions: _buildInputOptions(),
    );
  }

  // Input field styling options
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      inputTextStyle: const TextStyle(color: Colors.black),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _sendMessage(BuildContext context, ChatMessage message) {
    context.read<ChatCubit>().sendMessage(chatId, message.text);
  }
}
