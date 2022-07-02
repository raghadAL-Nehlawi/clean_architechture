import 'package:dartz/dartz.dart';

import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/user_model.dart';

abstract class AuthRepository extends BaseRepository {
  Future<Either<Failure, UserModel>> loginUser(String email, String password, int remember);

}