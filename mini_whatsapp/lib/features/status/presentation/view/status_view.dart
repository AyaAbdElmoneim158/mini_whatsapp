import 'package:flutter/material.dart';
import '../../data/models/status_model.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Status"),
      ),
      body: ListView(
        children: [
          _buildMyStatus(),
          const Divider(),
          _buildStatusSection("Recent updates", "Recent"),
          const Divider(),
          _buildStatusSection("Viewed updates", "Viewed"),
          const Divider(),
          _buildStatusSection("Muted updates", "Muted"),
        ],
      ),
    );
  }

  Widget _buildMyStatus() {
    return const ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/4140/4140037.png"),
            radius: 25,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green,
              child: Icon(Icons.add, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
      title: Text("My Status", style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("Tap to add status update"),
    );
  }

  Widget _buildStatusSection(String title, String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        ...Status.statuses.where((status) => status.category == category).map((status) => StatusTile(status: status)),
      ],
    );
  }
}

class StatusTile extends StatelessWidget {
  final Status status;

  const StatusTile({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(status.profileImage),
        radius: 25,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.green,
              width: 2,
            ), // Green border to mimic the WhatsApp style
          ),
        ),
      ),
      title: Text(status.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(status.time),
    );
  }
}
