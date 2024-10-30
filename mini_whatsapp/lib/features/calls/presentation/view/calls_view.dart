import 'package:flutter/material.dart';
import '../../data/models/call_model.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildCallList(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Calls"),
      backgroundColor: Colors.teal,
    );
  }

  Widget _buildCallList() {
    return ListView.builder(
      itemCount: Call.calls.length,
      itemBuilder: (context, index) {
        final call = Call.calls[index];
        return _buildCallTile(call);
      },
    );
  }

  ListTile _buildCallTile(Call call) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(call.profileImage),
      ),
      title: Text(
        call.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: call.isMissed ? Colors.red : Colors.black,
        ),
      ),
      subtitle: _buildCallSubtitle(call),
      trailing: _buildCallTrailingIcon(call),
    );
  }

  Row _buildCallSubtitle(Call call) {
    return Row(
      children: [
        Icon(
          call.callType == "Voice" ? Icons.phone : Icons.videocam,
          size: 16,
          color: call.isMissed ? Colors.red : Colors.green,
        ),
        const SizedBox(width: 5),
        Text(call.time),
      ],
    );
  }

  Icon _buildCallTrailingIcon(Call call) {
    return Icon(
      call.callType == "Voice" ? Icons.phone : Icons.videocam,
      color: Colors.teal,
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // Handle new call action
      },
      backgroundColor: Colors.teal,
      child: const Icon(Icons.add_call, color: Colors.white),
    );
  }
}
