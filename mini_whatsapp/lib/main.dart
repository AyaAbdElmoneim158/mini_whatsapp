import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'mini_whatsapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MiniWhatsapp());
}
