import 'package:dartz/dartz.dart';
import '../../data/model/base_local_data_source.dart';
import '../../data/model/base_remote_datasource.dart';
import '../../error/failures.dart';
import '../../network/network_info.dart';
import '../../utils/constants/constants.dart';




typedef FutureEitherOr<T> = Future<Either<Failure, T>> Function();
typedef FutureEitherOrWithToken<T> = Future<Either<Failure, T>> Function(
  String token,
);

///
///
/// The [BaseRepository] interface declares the basic and shared interaction between the domain layer and the data layer.
///
/// All the getters and functions in this class returns a [Future] of [Either] a [T] OR [Failure]
///
/// Each repository interface must extend from this interface
///
///
abstract class BaseRepository {
  ///
  /// This function checks if the device is connected to the network
  /// uses [NetworkInfo] interface to check if it's connected or not
  ///
  ///
  /// Params:
  ///   [body] which is a function that has the same return type of the [checkNetwork] function,
  ///   it's triggered when the connection result was retrieved
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [T]
  ///   return cases:
  ///     a- [ServerFailure] with [ErrorCode.NO_INTERNET_CONNECTION] if there was no Internet connection
  ///     b- Returns the value returned by the [body] function
  ///
  ///
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body);

  ///
  ///
  /// This function retrieves the user's token from the local data source
  ///
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [String]
  ///   return cases:
  ///     a- [Failure] if the token was null or empty
  ///     b- [String] which is the token value if it was successfully retrieved
  ///
  ///
  Future<Either<Failure, String>> getToken();

  ///
  ///
  /// This function retrieves the user's token from the local data source
  ///
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [AppLanguage]
  ///   return cases:
  ///     a- [Failure] if the token was null or empty
  ///     b- [AppLanguage] which is the current language
  ///
  ///

  ///
  ///
  /// This function retrieves the user's refresh token from the local data source
  ///
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [String]
  ///   return cases:
  ///     a- [Failure] if the token was null or empty
  ///     b- [String] which is the token value if it was successfully retrieved
  ///
  ///
  Future<Either<Failure, String>> getRefreshToken();




  ///
  /// This function is used to delete user cached data and log him out of the app
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [void]
  ///
  Future<Either<Failure, void>> logOutUser();





  ///
  ///
  /// This function is a wrapper that uses both [getToken] and [checkNetwork] functions
  ///
  ///
  /// Params:
  ///   [body] which is a function that has the same return type of the [requestWithToken] function and passes the token in its params,
  ///   it's triggered after these steps:
  ///     1- After checking the connection of the device using [checkNetwork], if it was connected you go to step two
  ///        if not it returns the value from the [checkNetwork] function immediately.
  ///
  ///     2- Gets the token using [getToken], if it was successfully retrieved, the [body] function gets triggered
  ///        with the token, if not, a cache failure gets returned
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [String]
  ///

}

/// [BaseRepositoryImpl] is the implementation of the [BaseRepository] interface
/// each repository must extend this class and implement a sub-interface of [BaseRepository] interface.
class BaseRepositoryImpl implements BaseRepository {
  final BaseLocalDataSource baseLocalDataSource;
  final NetworkInfo networkInfo;
  final BaseRemoteDataSource? baseRemoteDataSource;

  BaseRepositoryImpl({
    required this.baseLocalDataSource,
    required this.networkInfo,
    this.baseRemoteDataSource,
  });

  @override
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body) async {
    if (await networkInfo.isConnected) {
      return body();
    } else {
      return Left(ServerFailure(ErrorCode.NO_INTERNET_CONNECTION));
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    final token = await baseLocalDataSource.token;

    print(token);
    if (token != null && token.isNotEmpty) {
      return Right(token);
    } else {
      return Left(CacheFailure());
    }
  }





  @override
  Future<Either<Failure, String>> getRefreshToken() {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, void>> logOutUser() async {
    return Right(await baseLocalDataSource.logOutUser());
  }


}
