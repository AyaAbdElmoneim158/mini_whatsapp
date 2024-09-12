import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/chat_cubit.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final chatPartnerEmail = arguments['userEmail'];
    final authCubit = BlocProvider.of<AppCubit>(context);
    final currentUserEmail = authCubit.state.userEmail!;

    return BlocProvider(
      create: (context) => ChatCubit(currentUserEmail, chatPartnerEmail),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat with $chatPartnerEmail'),
        ),
        body: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }

            return DashChat(
              currentUser: ChatUser(
                firstName: currentUserEmail,
                id: currentUserEmail,
              ),
              messages: state.messages.map((msg) {
                return ChatMessage(
                  text: msg['text'],
                  user: ChatUser(
                    id: msg['sender'],
                    firstName: msg['sender'],
                  ),
                  createdAt:
                      DateTime.parse(msg['timestamp'].toDate().toString()),
                );
              }).toList(),
              onSend: (message) {
                BlocProvider.of<ChatCubit>(context).sendMessage(message.text);
              },
              inputOptions: InputOptions(
                inputDecoration: InputDecoration(
                  labelText: 'Enter your message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
