import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../core/utils/enum.dart';
import '../../../domain/entity/login_response.dart';
import '../../../domain/use case/login_resopnse_ues_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginResponseUseCase loginResponseUseCase;
  String myname = '';
  LoginBloc(this.loginResponseUseCase) : super(LoginState()) {
    on<LoginButtonPressedEvent>(_onLoginButtonPressedEvent);
  }

  FutureOr<void> _onLoginButtonPressedEvent(
      LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    final result = await loginResponseUseCase.call(LoginParams(
      email: event.email,
      password: event.password,
    ));
    result.fold(
      (l) {
        emit(
          state.copyWith(loginState: RequestState.error, message: l.message),
        );
      },
      (r) {
        myname = r.name;
        emit(
          state.copyWith(loginState: RequestState.loaded, loginResponse: r),
        );
      },
    );
  }
}
