import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_model.dart';
import '../../data/repo/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;

  ChatCubit(this.chatRepo) : super(ChatInitial());

  // Fetch all chats
  Future<void> getAllChats() async {
    emit(ChatLoading());
    final result = await chatRepo.getAllChats();
    result.fold(
      (failure) => emit(ChatError(message: failure.message)),
      (chats) => emit(ChatLoaded(chats: chats)),
    );
  }

  // Fetch a chat by its ID
  Future<void> getChatById(String chatId) async {
    emit(ChatLoading());
    final result = await chatRepo.getChatById(chatId);
    result.fold(
      (failure) => emit(ChatError(message: failure.message)),
      (chat) => emit(chat != null ? SingleChatLoaded(chat: chat) : ChatError(message: 'Chat not found')),
    );
  }

  // Send a message in a chat
  Future<void> sendMessage(String chatId, String message) async {
    emit(ChatLoading());
    final result = await chatRepo.sendChatMessage(chatId, message);
    result.fold(
      (failure) => emit(ChatMessageError(message: failure.message)),
      (success) => emit(ChatMessageSent()),
    );
  }
}
