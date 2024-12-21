part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel? user;

  ProfileLoaded({required this.user});
}

class ProfileUpdated extends ProfileState {
  final UserModel? user;

  ProfileUpdated({required this.user});
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure({required this.message});
}
