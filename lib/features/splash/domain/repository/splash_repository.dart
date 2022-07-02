import 'package:dartz/dartz.dart';
import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';

///
///
/// The [SplashRepository] interface extends from [BaseRepository] interface
/// It declares the interactions between the splash feature and the data sources
///
abstract class SplashRepository extends BaseRepository {
  /// [isLoggedIn] this function returns false if the user is not logged in
  /// and true if the user was already logged in
  Future<Either<Failure, bool>> isLoggedIn();
}
