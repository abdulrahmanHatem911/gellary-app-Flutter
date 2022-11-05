import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary_app/core/routers/app_routers.dart';
import 'package:gellary_app/core/utils/app_size.dart';
import 'package:gellary_app/core/utils/app_string.dart';
import 'package:gellary_app/core/utils/enum.dart';
import 'package:gellary_app/presentation/controller/galleryBloc/gallery_bloc.dart';
import 'package:gellary_app/presentation/widgets/build_gradiView.dart';
import 'package:gellary_app/presentation/widgets/select_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/services/cache_helper.dart';
import '../../core/services/services_locator.dart';
import '../../core/style/app_color.dart';
import '../controller/Login/login_bloc.dart';
import '../controller/galleryBloc/gallery_event.dart';
import '../controller/galleryBloc/gallery_state.dart';
import '../widgets/general_button.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              color: Colors.green,
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/gellary_background.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome \n ${BlocProvider.of<LoginBloc>(context).myname}',
                        style: GoogleFonts.balooThambi2(
                          fontSize: 30,
                          height: 0.9,
                          fontWeight: FontWeight.w500,
                          color: AppColor.gray02,
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(AppString.image),
                      ),
                    ],
                  ),
                  AppSize.sv_60,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GeneralButtonComponent(
                        text: 'log out',
                        color: Colors.red,
                        onPressed: () {
                          CacheHelper.saveData('token', '').then((value) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routers.loginScreen, (route) => false);
                          });
                        },
                        image: AppString.arrowLeft,
                      ),
                      AppSize.sh_20,
                      GeneralButtonComponent(
                        text: 'upload',
                        color: AppColor.gray03,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.white.withOpacity(0.3),
                              content: Container(
                                height: height * 0.2,
                                width: width * 0.2,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10.0),
                                    SelectImage(
                                        image: AppString.selectGallery,
                                        title: 'Gallery',
                                        onTap: () {
                                          BlocProvider.of<GalleryBloc>(context)
                                              .add(UploadImageEvent(
                                                  imageSource:
                                                      ImageSource.gallery));
                                          Navigator.pop(context);
                                        }),
                                    const SizedBox(height: 10.0),
                                    SelectImage(
                                        image: AppString.selectCamera,
                                        title: 'Camera',
                                        onTap: () {
                                          BlocProvider.of<GalleryBloc>(context)
                                              .add(UploadImageEvent(
                                                  imageSource:
                                                      ImageSource.camera));
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancle'),
                                ),
                              ],
                            ),
                          );
                        },
                        image: AppString.arrowUp,
                      ),
                    ],
                  ),
                  AppSize.sv_20,
                  BlocConsumer<GalleryBloc, GalleryState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state.images.isEmpty ||
                          state.images == null ||
                          state.images.length == 0) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state.images.isNotEmpty) {
                        return Expanded(
                          child: BuildGradViewComponent(
                            galleryData: state.images,
                          ),
                        );
                      } else if (state.galleryState == RequestState.error ||
                          state is LayoutGetImageErrorState) {
                        return const Center(
                          child: Text('error'),
                        );
                      } else {
                        return const Center(
                          child: Text('default'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
