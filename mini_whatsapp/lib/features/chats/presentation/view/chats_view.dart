import 'package:flutter/material.dart';
import '../../../../core/common/app_bar.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../data/models/chat_user.dart';
import 'widgets/chat_list_tile.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: false,
        title: "WhatsUp",
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.black,
              )),
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/profile'),
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.black,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildChatMessages()),
        ],
      ),
    );
  }

  Widget _buildChatMessages() {
    return ListView.builder(
      itemCount: ChatUserModel.chatUsers.length,
      itemBuilder: (context, index) {
        final chatUser = ChatUserModel.chatUsers[index];
        return ChatListTile(chatUser: chatUser);
      },
    );
  }
}
