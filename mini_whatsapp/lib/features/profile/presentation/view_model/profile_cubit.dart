import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/data/models/user.dart';
import '../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  late UserModel currentUser;

  Future<void> getProfile({required String uid}) async {
    emit(ProfileLoading());
    final result = await profileRepo.getProfile(uid: uid);
    result.fold(
      (failure) => emit(ProfileFailure(message: failure.message)),
      (user) {
        if (user != null) {
          currentUser = user; // Cache the current user data
          emit(ProfileLoaded(user: user));
        } else {
          emit(ProfileFailure(message: "User not found"));
        }
      },
    );
  }

  // Edit Profile
  Future<void> editProfile({required UserModel user, required String uid}) async {
    emit(ProfileLoading());
    final result = await profileRepo.editProfile(user: user, uid: uid);
    result.fold(
      (failure) => emit(ProfileFailure(message: failure.message)),
      (updatedUser) {
        if (updatedUser != null) {
          currentUser = updatedUser; // Update the cached current user data
          emit(ProfileUpdated(user: updatedUser));
        } else {
          emit(ProfileFailure(message: "Failed to update profile"));
        }
      },
    );
  }
}
