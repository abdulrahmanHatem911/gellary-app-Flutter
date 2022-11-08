import '../../core/error/exeption.dart';
import '../../domain/entity/gallery_data.dart';
import '../../domain/entity/login_response.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/base_gallery_repository.dart';

import '../data source/remote/remote_data_source.dart';

class GalleryRepository extends BaseGalleryRepository {
  final BaseRemoteGalleryDataSource remoteGalleryDataSource;
  GalleryRepository(this.remoteGalleryDataSource);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams parameters) async {
    final response = await remoteGalleryDataSource.loginToApp(parameters);
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, GalleryData>> getGalleryData() async {
    final response = await remoteGalleryDataSource.getGallery();
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }
}
