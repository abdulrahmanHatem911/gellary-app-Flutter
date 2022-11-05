import 'package:equatable/equatable.dart';
import 'package:gellary_app/core/utils/enum.dart';
import 'package:gellary_app/domain/entity/gallery_data.dart';

class GalleryState extends Equatable {
  final List images;
  final RequestState galleryState;
  final String message;
  const GalleryState({
    this.images = const [],
    this.galleryState = RequestState.loading,
    this.message = '',
  });
  GalleryState copyWith({
    List? images,
    RequestState? galleryState,
    String? message,
  }) {
    return GalleryState(
      images: images ?? this.images,
      galleryState: galleryState ?? this.galleryState,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        images,
        galleryState,
        message,
      ];
}

class LayoutGetImageSuccessState extends GalleryState {}

class LayoutGetImageErrorState extends GalleryState {}

class LayoutGetImageLoadingState extends GalleryState {}
