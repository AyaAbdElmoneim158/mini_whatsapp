part of 'auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final User? user;

  AuthSuccessState({this.user});
}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
