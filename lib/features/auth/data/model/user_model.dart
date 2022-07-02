import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  static final String className = 'UserModel';

  UserModel({
    required this.id,
    this.phone,
    this.name,
    required this.is_active,
    this.image,
    required this.is_admin,
    this.empty = true
  }) : super(
    id: id,
    phone: phone,
    name: name,
    is_active: is_active,
    is_admin: is_admin,

  );


  final int? id;
  final String? phone;
  final String? name;
  final String? image;
  final int is_admin;
  final int is_active;
  final bool empty;


  factory UserModel.fromJson(Map<String, dynamic> json) {
    print('json is $json');
    return _$UserModelFromJson(json);
  }

 Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
