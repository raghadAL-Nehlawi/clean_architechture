import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/data/model/user_model.dart';
import '../repository/main_repository.dart';

class GetUser extends UseCase<UserModel, GetUserParams> {
  final MainRepository repository;

  GetUser({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(params) async {
    return await repository.getUser();
  }
}

class GetUserParams {}
