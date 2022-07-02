import 'package:dartz/dartz.dart';
import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_local_data_sources.dart';
import '../data_source/auth_remote_data_source.dart';
import '../model/user_model.dart';

class AuthRepositoryImpl extends BaseRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
      baseRemoteDataSource: authRemoteDataSource,
      baseLocalDataSource: authLocalDataSource,
      networkInfo: networkInfo);

  @override
  Future<Either<Failure, UserModel>> loginUser(String email, String password, int remember) {
    return checkNetwork(() async {
      try {
        final result = await authRemoteDataSource.loginUser(
            email, password, remember);
        if (result != null) {
          if (result != null) {
            await authLocalDataSource.loginUser(
              result.user,
              result.token,
              result.rememberMeToken
            );
            return Right(result.user!);
          } else
            return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        }
        else  Left(ServerFailure(ErrorCode.UNAUTHENTICATED));
      } catch (e) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      }
      return Left(ServerFailure(ErrorCode.SERVER_ERROR));
    });

  }


}