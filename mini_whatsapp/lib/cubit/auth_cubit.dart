import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final FirebaseAuth _firebaseApp = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AppCubit() : super(AppState.initial());

  Future<void> signUp(String email, String password) async {
    emit(AppState.loading());

    try {
      UserCredential userCredential =
          await _firebaseApp.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(AppState.Appenticated(email));
    } catch (e) {
      emit(AppState.error(e.toString()));
    }
  }

  Future<void> logIn(String email, String password) async {
    emit(AppState.loading());

    try {
      await _firebaseApp.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AppState.Appenticated(email));
    } catch (e) {
      emit(AppState.error(e.toString()));
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseApp.signOut();
      emit(AppState.initial());
    } catch (e) {
      emit(AppState.error(e.toString()));
    }
  }

  Future<void> getAllUsers() async {
    emit(AppState.loading());

    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();
      List<Map<String, dynamic>> users = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      emit(AppState.usersLoaded(users));
    } catch (e) {
      emit(AppState.error(e.toString()));
    }
  }
}
