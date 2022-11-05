import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

class GetGalleryEvent extends GalleryEvent {}

class UploadImageEvent extends GalleryEvent {
  final ImageSource imageSource;
  UploadImageEvent({required this.imageSource});
}
