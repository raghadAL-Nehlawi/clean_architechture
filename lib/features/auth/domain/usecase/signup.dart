import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';



class SignUp extends UseCase<User,SignUpParams>{
  final AuthRepository repository;
  SignUp({required this.repository});
  @override
  Future<Either<Failure, User>>? call(SignUpParams params) {

  //  return repository.signup(params.email, params.phone, params.name, params.password);
  }

}


class SignUpParams extends Equatable{
  String email;
  String phone;
  String password;
  String name;
  SignUpParams({
    required this.password,
    required this.name,
    required this.phone,
    required this.email
});
  @override
  List<Object?> get props => [email, phone, name, password];

}

