import 'package:dartz/dartz.dart';

import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/data/model/user_model.dart';


abstract class MainRepository extends BaseRepository {
  Future<Either<Failure, UserModel>> getUser();
}
