import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/screen_config.dart';
import '../../controller/galleryBloc/gallery_bloc.dart';
import '../../controller/galleryBloc/gallery_event.dart';
import 'alery_elevated_button.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: SizeConfig.screenWidth * 0.1,
          height: SizeConfig.screenHeight * 0.3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.4),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenWidth,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AlertElevatedButton(
                    text: 'Gallery',
                    imagePath: AppString.selectGallery,
                    iconSize: 60.0,
                    onPressed: () {
                      BlocProvider.of<GalleryBloc>(context).add(
                          UploadImageEvent(imageSource: ImageSource.gallery));
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  AlertElevatedButton(
                    text: 'Camera',
                    imagePath: AppString.selectCamera,
                    iconSize: 60.0,
                    onPressed: () {
                      BlocProvider.of<GalleryBloc>(context).add(
                          UploadImageEvent(imageSource: ImageSource.camera));
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
