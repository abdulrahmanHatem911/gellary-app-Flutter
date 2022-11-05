import 'package:gellary_app/domain/entity/login_response.dart';

class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({
    required super.id,
    required super.email,
    required super.name,
    required super.emailVerifiedAt,
    required super.token,
  });

  //from json
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json['user']['id'] as int,
      email: json['user']['email'],
      name: json['user']['name'],
      emailVerifiedAt: json['user']['email_verified_at'],
      token: json['token'],
    );
  }
}
