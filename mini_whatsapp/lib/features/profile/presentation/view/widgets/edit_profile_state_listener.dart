import 'package:flutter/material.dart';

import '../../view_model/profile_cubit.dart';

void editProfileStateListener(BuildContext context, ProfileState state) {
  if (state is ProfileLoaded) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  } else if (state is ProfileFailure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${state.message}')),
    );
  }
}
