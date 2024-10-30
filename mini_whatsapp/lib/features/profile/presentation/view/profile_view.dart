import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfilePicture(),
            const SizedBox(height: 20),
            _buildProfileField("Name", "Brooklyn Simmons", Icons.person),
            const SizedBox(height: 15),
            _buildProfileField("About", "Available", Icons.info),
            const SizedBox(height: 15),
            _buildProfileField("Phone", "+2012345567", Icons.phone),
          ],
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

  Widget _buildProfilePicture() {
    return const Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/4140/4140037.png"),
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
