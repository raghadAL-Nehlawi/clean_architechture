import 'package:equatable/equatable.dart';

import '../../data/model/user_model.dart';

class AuthResponse extends Equatable {
  AuthResponse(
      this.token,
      this.user,
      this.rememberMeToken
      );

  final String token;
  final String? rememberMeToken;
  final UserModel user;

  @override
  List<Object> get props => [token];
}
