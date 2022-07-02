import 'package:dartz/dartz.dart';
import '../../error/failures.dart';

///
///
/// The [UseCase] interface has a single function which is [call], triggering this function would actually run the use case
///
/// [Type] is a generic type which will be the output of the use case
/// [Params] is a generic type which will be the the input of the use case
///
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>>?call(Params params);
}

class NoParams {}
