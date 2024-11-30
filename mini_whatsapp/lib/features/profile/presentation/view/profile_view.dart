import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuthSuccessState) {
              User? user = state.user;
              return _buildProfile(user);
            } else if (state is AuthErrorState) {
              return Center(child: Text(state.error));
            }
            return const Center(child: Text("Something went wrong"));
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.teal,
      elevation: 0,
      title: const Text("Profile"),
    );
  }

  Widget _buildProfile(User? user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfilePicture(user),
        const SizedBox(height: 20),
        _buildProfileField("Name", user?.displayName ?? "Unknown", Icons.person),
        const SizedBox(height: 15),
        _buildProfileField("Email", user?.email ?? "Unknown", Icons.email),
        const SizedBox(height: 15),
        _buildProfileField("Phone", user?.phoneNumber ?? "Unknown", Icons.phone),
      ],
    );
  }

  Widget _buildProfilePicture(User? user) {
    String photoUrl = user?.photoURL ?? "https://cdn-icons-png.flaticon.com/512/4140/4140037.png";
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(photoUrl),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: Colors.teal,
            radius: 18,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileField(String label, String text, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label *",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            hintText: text,
            prefixIcon: Icon(icon, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
