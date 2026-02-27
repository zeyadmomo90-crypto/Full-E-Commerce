// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) =>
    CreateUserResponse(
      email: json['email'] as String?,
      password: json['password'] as String?,
      userPic: json['userPic'] as String?,
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$CreateUserResponseToJson(CreateUserResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'userPic': instance.userPic,
      'name': instance.name,
      'id': instance.id,
      'role': instance.role,
    };
