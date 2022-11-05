import 'package:dartz/dartz.dart';
import 'package:gellary_app/core/error/failure.dart';
import 'package:gellary_app/domain/entity/gallery_data.dart';

import '../entity/login_response.dart';

abstract class BaseGalleryRepository {
  Future<Either<Failure, LoginResponse>> login(LoginParams parameters);
  Future<Either<Failure, GalleryData>> getGalleryData();
}
