import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';

class Login extends UseCase<User, LoginParams> {
  final AuthRepository repository;

  Login({required this.repository});

  @override
  Future<Either<Failure, User>> call(params) async {
    return await repository.loginUser(params.phone, params.password,params.remember );
  }
}

class LoginParams extends Equatable {
  final String phone;
  final String password;
  final int remember;

  LoginParams({
    required this.phone,
    required this.password,
    required this.remember
  });

  @override
  List<Object> get props => [
    phone,
    password,
    remember
  ];
}
