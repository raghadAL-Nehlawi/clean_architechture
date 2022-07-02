import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repository/splash_repository.dart';

///
///
/// The [IsLoggedIn] is responsible for communicating with the [SplashRepository] interface
///
/// Returns:
///   - Right of true if the user has already logged in
///   - Right of false if the user is not logged in
///   - Left of [Failure] if there was an error retrieving the boolean
///
///
class IsLoggedIn extends UseCase<bool, IsLoggedInParams> {
  final SplashRepository repository;

  IsLoggedIn({required this.repository});

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await repository.isLoggedIn();
  }
}

class IsLoggedInParams extends Equatable {
  @override
  List<Object> get props => [];
}
