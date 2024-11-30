import '../../../../../core/utils/helper/auth_helper.dart';
import 'auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/error/failure.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this.authHelper);

  final AuthHelper authHelper;

  @override
  Future<Either<Failure, User?>> login({
    required String email,
    required String password,
  }) async {
    return await _handleAuthOperation(
      () => authHelper.loginWithEmailAndPassword(email: email, password: password),
      errorMessage: 'Login failed',
    );
  }

  @override
  Future<Either<Failure, User?>> register({
    required String email,
    required String password,
  }) async {
    return await _handleAuthOperation(
      () => authHelper.signUpWithEmailAndPassword(email: email, password: password),
      errorMessage: 'Registration failed',
    );
  }

  @override
  Either<Failure, Stream<User?>> authStateChanges() {
    return _handleSyncOperation(
      () => authHelper.authStateChanges,
      errorMessage: 'Failed to retrieve auth state changes',
    );
  }

  @override
  Either<Failure, User?> currentUser() {
    return _handleSyncOperation(
      () => authHelper.currentUser,
      errorMessage: 'Failed to retrieve current user',
    );
  }

  // Private helper method for async operations
  Future<Either<Failure, T>> _handleAuthOperation<T>(
    Future<T> Function() operation, {
    required String errorMessage,
  }) async {
    try {
      final result = await operation();
      return Right(result);
    } catch (e) {
      return Left(Failure(errorMessage, e is Exception ? e : Exception(e.toString())));
    }
  }

  // Private helper method for synchronous operations
  Either<Failure, T> _handleSyncOperation<T>(
    T Function() operation, {
    required String errorMessage,
  }) {
    try {
      final result = operation();
      return Right(result);
    } catch (e) {
      return Left(Failure(errorMessage, e is Exception ? e : Exception(e.toString())));
    }
  }
}
