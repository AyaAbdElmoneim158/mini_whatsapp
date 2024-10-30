import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static List<BottomNavigationBarItem> items(int currentIndex) => const [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outlined),
          label: "Status",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: "Calls",
        ),
      ];

  static List<Widget> screens = const [
    Scaffold(body: Center(child: Text("Chats", style: TextStyle(fontSize: 32)))),
    Scaffold(body: Center(child: Text("Status", style: TextStyle(fontSize: 32)))),
    Scaffold(body: Center(child: Text("Calls", style: TextStyle(fontSize: 32)))),
  ];
}
