import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/helper/auth_helper.dart';
import 'core/utils/helper/firestore_helper.dart';
import 'features/auth/data/repo/auth_repo/auth_repo.dart';
import 'features/auth/data/repo/auth_repo/auth_repo_impl.dart';
import 'features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'features/profile/data/repo/profile_repo.dart';
import 'features/profile/data/repo/profile_repo_impl.dart';
import 'features/profile/presentation/view_model/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initFirebaseServices();
  _initAuth();
  _initProfile();
}

void _initFirebaseServices() {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}

void _initAuth() {
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        AuthHelper.instance,
        FirestoreHelper.instance,
      ));
  sl.registerFactory(() => AuthCubit(sl<AuthRepo>()));
}

void _initProfile() {
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(FirestoreHelper.instance));
  sl.registerFactory(() => ProfileCubit(sl<ProfileRepo>()));
}
