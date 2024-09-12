import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AppCubit>(context).getAllUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Whats app'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              BlocProvider.of<AppCubit>(context).logOut();
            },
          ),
        ],
      ),
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (!state.isAppenticated) {
            Navigator.pushReplacementNamed(context, '/login');
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          if (state.users != null && state.users!.isNotEmpty) {
            return ListView.builder(
              itemCount: state.users!.length,
              itemBuilder: (context, index) {
                final user = state.users![index];
                return ListTile(
                  title: Text(user['email'] ?? 'No Email'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/chat',
                      arguments: {'userEmail': user['email']},
                    );
                  },
                );
              },
            );
          }

          return const Center(child: Text('No users found.'));
        },
      ),
    );
  }
}
