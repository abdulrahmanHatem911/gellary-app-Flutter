import 'package:equatable/equatable.dart';

import '../../../core/utils/enum.dart';
import '../../../domain/entity/login_response.dart';

class LoginState extends Equatable {
  final LoginResponse? loginResponse;
  final RequestState loginState;
  final String message;
  const LoginState({
    this.loginResponse,
    this.loginState = RequestState.initial,
    this.message = '',
  });
  LoginState copyWith({
    LoginResponse? loginResponse,
    RequestState? loginState,
    String? message,
  }) {
    return LoginState(
      loginResponse: loginResponse ?? this.loginResponse,
      loginState: loginState ?? this.loginState,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        loginResponse,
        loginState,
        message,
      ];
}
