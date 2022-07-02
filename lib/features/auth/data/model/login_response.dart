
import 'package:clean_architechture/features/auth/data/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/login_entity.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponseModel extends AuthResponse{
  LoginResponseModel({
    required this.token,
    required this.user,
    required this.rememberMeToken
  }) : super(token,  user!, rememberMeToken);

  final String token;
  final String? rememberMeToken;
  final UserModel user;


  static LoginResponseModel fromJson(Map<String, dynamic> json) {
    print('login response model is ${json}');
    return _$LoginResponseModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}