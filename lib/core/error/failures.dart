import '../error/exceptions.dart';
import '../utils/constants/constants.dart';

///
///
/// [Failure] interface
///
/// Each failure class must implement this interface
///
/// Sub-classes:
///   a- [ServerFailure]
///   b- [CacheFailure]
///
abstract class Failure {}

///
/// The [ServerFailure] class is responsible for presenting the errors caused by remote data sources error
/// which holds [errorCode] inside it
///
/// [ServerFailure] implements [Failure] interface
///
/// [ServerFailure] is returned from the repositories after catching the [ServerException] thrown by the remote data sources
///
class ServerFailure implements Failure {
  final ErrorCode errorCode;

  ServerFailure(this.errorCode);
}

///
/// The [CacheFailure] class is responsible for presenting the errors caused by local data sources error
///
/// [CacheFailure] implements [Failure] interface
///
/// [CacheFailure] is returned from the repositories after catching the [CacheException] thrown by the local data sources
///
class CacheFailure implements Failure {}
