import 'package:dartz/dartz.dart';
import '../../../../../core/utils/error/failure.dart';
import '../../../auth/data/models/user.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel?>> getProfile({
    required String uid,
  });

  Future<Either<Failure, UserModel?>> editProfile({
    required UserModel user,
    required String uid,
  });
}
