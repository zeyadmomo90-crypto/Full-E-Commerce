import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_response.g.dart';

@JsonSerializable()
class CreateUserResponse {
  final String? email;
  final String? password;
  final String? userPic;
  final String? name;
  final int? id;
  final String? role;

  CreateUserResponse({
    this.email,
    this.password,
    this.userPic,
    this.name,
    this.id,
    this.role,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}
