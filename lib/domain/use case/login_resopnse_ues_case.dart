import 'package:gellary_app/domain/entity/login_response.dart';
import 'package:gellary_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:gellary_app/domain/repository/base_gallery_repository.dart';

class LoginResponseUseCase {
  final BaseGalleryRepository repository;
  LoginResponseUseCase(this.repository);
  Future<Either<Failure, LoginResponse>> call(LoginParams parameters) async {
    return await repository.login(parameters);
  }
}
