part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatModel> chats;

  ChatLoaded({required this.chats});
}

class ChatError extends ChatState {
  final String message;

  ChatError({required this.message});
}

class ChatMessageSent extends ChatState {}

class ChatMessageError extends ChatState {
  final String message;

  ChatMessageError({required this.message});
}

class SingleChatLoaded extends ChatState {
  final ChatModel chat;

  SingleChatLoaded({required this.chat});
}
