import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/app_state.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state.isAppenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Successfully Signed Up")),
            );
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushReplacementNamed(context, '/home');
            });
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AppCubit>(context).signUp(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  child: (state.isLoading)
                      ? const Center(
                          child: SizedBox(
                          width: 24,
                          child: CircularProgressIndicator(),
                        ))
                      : const Text("Sign Up"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("Already have an account? Log In"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
