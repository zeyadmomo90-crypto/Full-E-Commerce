import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_request.g.dart';

@JsonSerializable()
class CreateUserRequest {
  final String? userId;
  final String? name;
  final String? email;
  final String? password;
  final String? avatar;

  CreateUserRequest({
    this.name,
    this.email,
    this.password,
    this.avatar,
    this.userId,
  });

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}
