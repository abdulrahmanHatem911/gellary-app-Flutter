import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/routers/app_routers.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/app_string.dart';
import '../../core/utils/enum.dart';
import '../controller/galleryBloc/gallery_bloc.dart';
import '../widgets/gallery/build_gradiView.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/services/cache_helper.dart';
import '../../core/style/app_color.dart';
import '../../core/utils/screen_config.dart';
import '../controller/Login/login_bloc.dart';
import '../controller/galleryBloc/gallery_state.dart';
import '../widgets/gallery/show_alert_dialog.dart';
import '../widgets/gallery/general_button.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
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
                      const GalleryUploadImage(),
                    ],
                  ),
                  AppSize.sv_20,
                  BlocConsumer<GalleryBloc, GalleryState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state.galleryState == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state.galleryState == RequestState.loaded ||
                          state.images.isNotEmpty) {
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

class GalleryUploadImage extends StatelessWidget {
  const GalleryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralButtonComponent(
      text: 'upload',
      color: AppColor.gray03,
      image: AppString.arrowUp,
      onPressed: () {
        showDialog(
            context: context,
            barrierColor: Colors.transparent,
            builder: (BuildContext context) => const ShowAlertDialog());
      },
    );
  }
}
