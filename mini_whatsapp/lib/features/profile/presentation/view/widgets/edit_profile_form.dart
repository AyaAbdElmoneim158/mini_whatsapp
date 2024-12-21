import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/profile_cubit.dart';

Widget buildEditProfileForm(
  BuildContext context,
  GlobalKey<FormState> formKey,
  TextEditingController usernameController,
  TextEditingController emailController,
  TextEditingController phoneController,
) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        TextFormField(
          controller: usernameController,
          decoration: const InputDecoration(labelText: 'Username'),
          validator: (value) => value == null || value.isEmpty ? 'Enter username' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Email'),
          validator: (value) => value == null || value.isEmpty ? 'Enter email' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(labelText: 'Phone'),
          validator: (value) => value == null || value.isEmpty ? 'Enter phone' : null,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              final cubit = context.read<ProfileCubit>();
              cubit.editProfile(
                user: cubit.currentUser.copyWith(
                  name: usernameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                ),
                uid: cubit.currentUser.id!,
              );
            }
          },
          child: const Text('Save Changes'),
        ),
      ],
    ),
  );
}
