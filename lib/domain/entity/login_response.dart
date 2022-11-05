import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final int id;
  final String email;
  final String name;
  final String emailVerifiedAt;
  final String token;

  const LoginResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.emailVerifiedAt,
    required this.token,
  });
  @override
  List<Object> get props => [
        id,
        email,
        name,
        emailVerifiedAt,
        token,
      ];
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
