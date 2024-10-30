import 'package:flutter/material.dart';

import '../../../features/calls/presentation/view/calls_view.dart';
import '../../../features/chats/presentation/view/chats_view.dart';
import '../../../features/status/presentation/view/status_view.dart';

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
    ChatView(), // Scaffold(body: Center(child: Text("Chats", style: TextStyle(fontSize: 32)))),
    StatusScreen(), //  Scaffold(body: Center(child: Text("Status", style: TextStyle(fontSize: 32)))),
    CallScreen(), //  Scaffold(body: Center(child: Text("Calls", style: TextStyle(fontSize: 32)))),
  ];
}
