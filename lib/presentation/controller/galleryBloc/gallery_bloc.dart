import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import '../../../domain/use%20case/get_gallery_use_case.dart';
import 'gallery_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/enum.dart';
import 'gallery_event.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GetGalleryUseCase getGalleryUseCase;
  File? profileImage;
  final ImagePicker _picker = ImagePicker();
  GalleryBloc(this.getGalleryUseCase) : super(const GalleryState()) {
    on<GetGalleryEvent>(_getGalleryListData);
    on<UploadImageEvent>(_uploadImage);
  }

  FutureOr<void> _getGalleryListData(
      GetGalleryEvent event, Emitter<GalleryState> emit) async {
    final result = await getGalleryUseCase.call();
    result.fold(
      (l) {
        print("Error in gallery bloc🔥");
        emit(
          state.copyWith(galleryState: RequestState.error, message: l.message),
        );
      },
      (r) {
        print('the image list is 🚀${r.images}');
        emit(
          state.copyWith(galleryState: RequestState.loaded, images: r.images),
        );
      },
    );
  }

  FutureOr<void> _uploadImage(
      UploadImageEvent event, Emitter<GalleryState> emit) async {
    // to get image for user
    emit(LayoutGetImageLoadingState());
    final pickedFile = await _picker.getImage(source: event.imageSource);
    if (PickedFile != null) {
      profileImage = File(pickedFile!.path);

      print('the image is 🚀${profileImage!.path}');
      emit(LayoutGetImageSuccessState());
    } else {
      print('No image selected');
      emit(LayoutGetImageErrorState());
    }
    await _getGalleryListData(
      GetGalleryEvent(),
      emit,
    );
  }
}
