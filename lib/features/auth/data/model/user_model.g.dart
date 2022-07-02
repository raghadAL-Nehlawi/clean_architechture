// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      is_active: json['is_active'] as int,
      image: json['image'] as String?,
      is_admin: json['is_admin'] as int,
      empty: json['empty'] as bool? ?? true,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'name': instance.name,
      'image': instance.image,
      'is_admin': instance.is_admin,
      'is_active': instance.is_active,
      'empty': instance.empty,
    };
