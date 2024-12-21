import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/full_scroll_screen_container.dart';
import '../../../../injection_container.dart';
import '../view_model/profile_cubit.dart';
import 'widgets/edit_profile_form.dart';
import 'widgets/edit_profile_state_listener.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final GlobalKey<FormState> _editProfileFormKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    final profileCubit = sl<ProfileCubit>();
    profileCubit.getProfile(uid: 'user_id_here'); // Replace with actual user ID
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileCubit>(),
      child: FullScrollScreenContainer(
        hasHight: true,
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            editProfileStateListener(context, state);
          },
          builder: (context, state) {
            if (state is ProfileLoaded) {
              _usernameController.text = state.user!.name ?? '';
              _emailController.text = state.user!.email ?? '';
              _phoneController.text = state.user!.phone ?? '';
            }

            return buildEditProfileForm(
              context,
              _editProfileFormKey,
              _usernameController,
              _emailController,
              _phoneController,
            );
          },
        ),
      ),
    );
  }
}
