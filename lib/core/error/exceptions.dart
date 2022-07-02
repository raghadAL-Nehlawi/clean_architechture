
import '../utils/constants/constants.dart';

///
///
/// The [ServerException] class is responsible for presenting the error returned from a remote data access.
/// which holds [errorCode] inside it
///
/// [ServerException] implements [Exception] interface
///
/// [ServerException] is thrown from the remote data sources and handled in the repositories
///
class ServerException implements Exception {
  final ErrorCode errorCode;

  ServerException(this.errorCode);
}

///
/// The [CacheException] class is responsible for presenting the error returned from a local data access.
///
/// [CacheException] implements [Exception] interface
///
/// [CacheException] is thrown from the local data sources and handled in the repositories
///
class CacheException implements Exception {}
