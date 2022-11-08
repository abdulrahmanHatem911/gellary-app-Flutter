import '../../domain/entity/gallery_data.dart';

class GetGalleryDataModel extends GalleryData {
  const GetGalleryDataModel({
    required super.images,
  });
  factory GetGalleryDataModel.fromJson(Map<String, dynamic> json) {
    return GetGalleryDataModel(
      images: List<String>.from(json["data"]["images"].map((x) => x)),
    );
  }
}
