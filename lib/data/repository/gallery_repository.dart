import 'package:gellary_app/core/error/exeption.dart';
import 'package:gellary_app/domain/entity/gallery_data.dart';
import 'package:gellary_app/domain/entity/login_response.dart';
import 'package:gellary_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:gellary_app/domain/repository/base_gallery_repository.dart';

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
