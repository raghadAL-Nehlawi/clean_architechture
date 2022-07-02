import 'package:dartz/dartz.dart';

import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/splash_repository.dart';
import '../data_source/splash_local_data_source.dart';

///
///
/// The [SplashRepositoryImpl] class extends from [BaseRepositoryImpl] class
/// It declares the interactions between the splash feature and the data sources
/// And handles the exception thrown by the data sources and return the corresponding [Failure] class
///
class SplashRepositoryImpl extends BaseRepositoryImpl
    implements SplashRepository {
  final SplashLocalDataSource splashLocalDataSource;

  SplashRepositoryImpl({
    required this.splashLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: splashLocalDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    final isLoggedIn = await splashLocalDataSource.isLoggedIn;
    if (isLoggedIn != null && isLoggedIn) {
      return Right(true);
    } else if (isLoggedIn != null && !isLoggedIn)
      return Right(false);
    else {
      return Left(CacheFailure());
    }
  }
}
