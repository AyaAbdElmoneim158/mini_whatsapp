import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/app_bar.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../injection_container.dart';
import '../../data/models/chat_model.dart';
import '../view_model/chat_cubit.dart';
import 'widgets/chat_list_tile.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChatCubit>()..getAllChats(),
      child: Scaffold(
        appBar: CustomAppBar(
          hasLeading: false,
          title: "WhatsUp",
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.black,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/profile'),
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ChatLoaded) {
              return _buildChatMessages(state.chats);
            } else if (state is ChatError) {
              return Center(
                child: Text(
                  state.message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }
            return const Center(
              child: Text("No chats available"),
            );
          },
        ),
      ),
    );
  }

  Widget _buildChatMessages(List<ChatModel> chats) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ChatListTile(chat: chat);
      },
    );
  }
}
