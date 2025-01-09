import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/firebase_options.dart';
import 'features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'mini_whatsapp.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  await setupLocator();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthCubit>(create: (_) => sl<AuthCubit>()),
  ], child: const MiniWhatsapp()));
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
