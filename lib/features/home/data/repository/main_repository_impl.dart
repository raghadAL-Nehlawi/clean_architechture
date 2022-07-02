import 'package:dartz/dartz.dart';

import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import '../../../../core/data/model/base_local_data_source.dart';
import '../../../../core/data/model/base_remote_datasource.dart';
import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/data/model/user_model.dart';
import '../../domain/repository/main_repository.dart';

class MainRepositoryImpl extends BaseRepositoryImpl implements MainRepository {
  MainRepositoryImpl({
    required BaseLocalDataSource baseLocalDataSource,
    required BaseRemoteDataSource baseRemoteDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          networkInfo: networkInfo,
          baseLocalDataSource: baseLocalDataSource,
          baseRemoteDataSource: baseRemoteDataSource,
        );

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    return Right(await baseLocalDataSource.personalInfo);
  }
}
