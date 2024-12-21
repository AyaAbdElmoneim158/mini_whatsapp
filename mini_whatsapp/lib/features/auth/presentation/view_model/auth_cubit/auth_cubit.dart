import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/utils/error/failure.dart';
import '../../../data/models/user.dart';
import '../../../data/repo/auth_repo/auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Either<Failure, Stream<User?>> listenToAuthChanges() {
    final result = authRepo.authStateChanges();
    return result.fold(
      (failure) {
        emit(AuthErrorState(failure.message));
        return Left(failure);
      },
      (stream) => Right(stream),
    );
  }

  Either<Failure, User?> getCurrentUser() {
    final result = authRepo.currentUser();
    return result.fold(
      (failure) {
        emit(AuthErrorState(failure.message));
        return Left(failure);
      },
      (user) => Right(user),
    );
  }

  Future<void> checkAuthStatus() async {
    final result = authRepo.currentUser();

    result.fold(
      (failure) {
        emit(AuthErrorState(failure.message));
      },
      (user) {
        if (user != null) {
          emit(AuthSuccessState(user: user));
        } else {
          emit(AuthErrorState("No user is logged in.")); // Not authenticated
        }
      },
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
      (failure) => emit(AuthErrorState(failure.message)),
      (user) => emit(AuthSuccessState()),
    );
  }

  Future<void> register({required UserModel user}) async {
    emit(AuthLoadingState());
    final result = await authRepo.register(user: user);
    result.fold(
      (failure) => emit(AuthErrorState(failure.message)),
      (user) => emit(AuthSuccessState()),
    );
  }
}
