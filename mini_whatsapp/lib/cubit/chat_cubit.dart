import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatState {
  final bool isLoading;
  final List<Map<String, dynamic>> messages;
  final String? errorMessage;

  ChatState({
    required this.isLoading,
    required this.messages,
    this.errorMessage,
  });

  factory ChatState.initial() {
    return ChatState(
      isLoading: false,
      messages: [],
    );
  }

  factory ChatState.loading() {
    return ChatState(
      isLoading: true,
      messages: [],
    );
  }

  factory ChatState.loaded(List<Map<String, dynamic>> messages) {
    return ChatState(
      isLoading: false,
      messages: messages,
    );
  }

  factory ChatState.error(String errorMessage) {
    return ChatState(
      isLoading: false,
      messages: [],
      errorMessage: errorMessage,
    );
  }
}

class ChatCubit extends Cubit<ChatState> {
  final String currentUserEmail;
  final String chatPartnerEmail;
  late CollectionReference _chatCollection;

  ChatCubit(this.currentUserEmail, this.chatPartnerEmail)
      : super(ChatState.initial()) {
    _chatCollection = FirebaseFirestore.instance
        .collection('chats')
        .doc(currentUserEmail)
        .collection(chatPartnerEmail);
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    emit(ChatState.loading());

    try {
      QuerySnapshot querySnapshot =
          await _chatCollection.orderBy('timestamp').get();
      List<Map<String, dynamic>> messages = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      emit(ChatState.loaded(messages));
    } catch (e) {
      emit(ChatState.error(e.toString()));
    }
  }

  Future<void> sendMessage(String messageText) async {
    if (messageText.isNotEmpty) {
      try {
        await _chatCollection.add({
          'text': messageText,
          'sender': currentUserEmail,
          'timestamp': FieldValue.serverTimestamp(),
        });
        _loadMessages(); // Reload messages after sending a new one
      } catch (e) {
        emit(ChatState.error(e.toString()));
      }
    }
  }
}
