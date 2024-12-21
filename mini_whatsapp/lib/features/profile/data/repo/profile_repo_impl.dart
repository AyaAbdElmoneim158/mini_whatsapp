import 'package:dartz/dartz.dart';
import '../../../../../core/utils/error/failure.dart';
import '../../../../../core/utils/helper/firestore_helper.dart';
import '../../../auth/data/models/user.dart';
import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  ProfileRepoImpl(this.firestoreHelper);
  final FirestoreHelper firestoreHelper;

  @override
  Future<Either<Failure, UserModel?>> editProfile({required UserModel user, required String uid}) async {
    try {
      await firestoreHelper.setData(
        path: 'users/$uid',
        data: user.toJson(),
      );
      return Right(user);
    } catch (e) {
      return Left(Failure('Failed to update profile', e is Exception ? e : Exception(e.toString())));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> getProfile({required String uid}) async {
    try {
      final document = await firestoreHelper.fetchDocument(path: 'users/$uid');
      if (document != null) {
        return Right(UserModel.fromJson(document));
      } else {
        return Left(Failure('Profile not found'));
      }
    } catch (e) {
      return Left(Failure('Failed to retrieve profile', e is Exception ? e : Exception(e.toString())));
    }
  }
}
