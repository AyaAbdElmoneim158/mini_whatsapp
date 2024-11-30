import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, User?>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User?>> register({
    required String email,
    required String password,
  });
  Either<Failure, Stream<User?>> authStateChanges();
  Either<Failure, User?> currentUser();
}
