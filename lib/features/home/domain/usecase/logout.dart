import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repository/main_repository.dart';


class Logout extends UseCase<Null, LogoutParams> {
  final MainRepository repository;

  Logout({required this.repository});

  @override
  Future<Either<Failure, Null>> call(LogoutParams params) async {
    await repository.logOutUser();
    return Right(null);
  }
}

class LogoutParams extends Equatable {
  @override
  List<Object> get props => [];
}
