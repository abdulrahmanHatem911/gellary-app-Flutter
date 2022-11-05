import 'package:equatable/equatable.dart';

class GalleryData extends Equatable {
  final List<String> images;
  const GalleryData({
    required this.images,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        images,
      ];
}
