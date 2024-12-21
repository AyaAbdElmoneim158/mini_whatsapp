import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/error/failure.dart';
import '../../models/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, User?>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User?>> register({
    required UserModel user,
  });
  Either<Failure, Stream<User?>> authStateChanges();
  Either<Failure, User?> currentUser();
}
