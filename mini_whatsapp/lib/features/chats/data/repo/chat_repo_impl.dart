import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/utils/error/failure.dart';
import '../../../../core/utils/helper/firestore_helper.dart';
import '../models/chat_model.dart';
import 'chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final FirestoreHelper _firestore;

  ChatRepoImpl(this._firestore);

  @override
  Future<Either<Failure, List<ChatModel>>> getAllChats() async {
    try {
      final chats = await _firestore.fetchCollection(path: 'CHATS');
      final chatModels = chats.map((data) {
        final id = data['id'] as String? ?? '';
        return ChatModel.fromJson({...data, 'id': id});
      }).toList();
      return Right(chatModels);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatModel?>> getChatById(String chatId) async {
    try {
      final data = await _firestore.fetchDocument(path: 'CHATS/$chatId');
      if (data == null) return const Right(null);
      final chat = ChatModel.fromJson({...data, 'id': chatId});
      return Right(chat);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendChatMessage(String chatId, String message) async {
    try {
      final messageData = {
        'senderId': chatId, //! Replace with actual logic for user ID
        'content': message,
        'timestamp': FieldValue.serverTimestamp(),
      };

      await _firestore.addData(
        path: 'CHATS/$chatId/messages',
        data: messageData,
      );
      await _firestore.updateData(
        path: 'CHATS/$chatId',
        data: {'lastUpdated': FieldValue.serverTimestamp()},
      );

      return const Right(true);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
