import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entity/gallery_data.dart';
import '../repository/base_gallery_repository.dart';

class GetGalleryUseCase {
  final BaseGalleryRepository repository;
  GetGalleryUseCase(this.repository);
  Future<Either<Failure, GalleryData>> call() async {
    return await repository.getGalleryData();
  }
}
