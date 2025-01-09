import 'package:dartz/dartz.dart';
import '../../../../../core/utils/error/failure.dart';
import '../models/chat_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<ChatModel>>> getAllChats();
  Future<Either<Failure, ChatModel?>> getChatById(String chatId);
  Future<Either<Failure, bool>> sendChatMessage(String chatId, String message);
}
