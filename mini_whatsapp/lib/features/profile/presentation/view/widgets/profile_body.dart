import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../auth/data/models/user.dart';

Widget buildProfileBody(UserModel? user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildProfilePicture(null),
      SizedBox(height: 20.h),
      _buildProfileField("Name", user?.name ?? "Unknown", Icons.person),
      SizedBox(height: 15.h),
      _buildProfileField("Email", user?.email ?? "Unknown", Icons.email),
      SizedBox(height: 15.h),
      _buildProfileField("Phone", user?.phone ?? "Unknown", Icons.phone),
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
      const Positioned(
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
      SizedBox(height: 5.h),
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
