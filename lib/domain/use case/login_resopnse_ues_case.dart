import '../entity/login_response.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../repository/base_gallery_repository.dart';

class LoginResponseUseCase {
  final BaseGalleryRepository repository;
  LoginResponseUseCase(this.repository);
  Future<Either<Failure, LoginResponse>> call(LoginParams parameters) async {
    return await repository.login(parameters);
  }
}
