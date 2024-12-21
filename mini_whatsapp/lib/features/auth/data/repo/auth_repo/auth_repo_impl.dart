import 'package:uuid/uuid.dart';
import '../../../../../core/utils/helper/auth_helper.dart';
import '../../models/user.dart';
import 'auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/error/failure.dart';
import '../../../../../core/utils/helper/firestore_helper.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this.authHelper, this.firestoreHelper);

  final AuthHelper authHelper;
  final FirestoreHelper firestoreHelper;

  // UUID generator instance
  final Uuid _uuid = Uuid();

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
    required UserModel user,
  }) async {
    return await _handleAuthOperation(
      () async {
        final authUser = await authHelper.signUpWithEmailAndPassword(
          email: user.email!,
          password: user.password!,
        );
        if (authUser != null) {
          await _registerUserInFirestore(user);
        }
        return authUser;
      },
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

  // Private method to register user in Firestore
  Future<void> _registerUserInFirestore(UserModel user) async {
    final userId = _uuid.v4();
    final userData = user.toJson();
    await firestoreHelper.setData(
      path: 'users/$userId',
      data: userData,
    );
  }

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
