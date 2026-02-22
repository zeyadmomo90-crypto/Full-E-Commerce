// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  email: json['email'] as String,
  name: json['name'] as String,
  userPicture: json['userPicture'] as String,
  userId: json['userId'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'email': instance.email,
  'name': instance.name,
  'userPicture': instance.userPicture,
  'userId': instance.userId,
};
