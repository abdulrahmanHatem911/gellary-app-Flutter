import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary_app/core/routers/app_routers.dart';
import 'package:gellary_app/core/services/services_locator.dart';
import 'package:gellary_app/core/style/app_color.dart';
import 'package:gellary_app/core/utils/app_string.dart';
import 'package:gellary_app/presentation/controller/Login/login_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/services/cache_helper.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/enum.dart';
import '../../core/utils/screen_config.dart';
import '../controller/Login/login_event.dart';
import '../controller/Login/login_state.dart';
import '../widgets/login/text_form_filed_component.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              color: AppColor.gray01,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(AppString.loginBackgroundImage),
              ),
            ),
            Positioned(
              top: -30,
              left: -40,
              child: SizedBox(
                width: SizeConfig.screenHeight * 0.4,
                height: SizeConfig.screenHeight * 0.3,
                child: Image(
                  image: AssetImage(AppString.loginCamera),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'My \nGallery',
                    style: GoogleFonts.balooThambi2(
                      fontSize: 40,
                      height: 0.9,
                      fontWeight: FontWeight.bold,
                      color: AppColor.gray02,
                    ),
                  ),
                  AppSize.sv_10,
                  Container(
                    width: SizeConfig.screenWidth * 0.8,
                    height: SizeConfig.screenHeight * 0.45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'LOG IN',
                                style: GoogleFonts.balooThambi2(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.gray02,
                                ),
                              ),
                              AppSize.sv_10,
                              TextFormComponent(
                                controller: emailController,
                                hintText: 'uer name',
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                              AppSize.sv_20,
                              TextFormComponent(
                                controller: passwordController,
                                hintText: 'password',
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              AppSize.sv_10,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: BlocConsumer<LoginBloc, LoginState>(
                                  listener: (context, state) {
                                    if (state.loginState ==
                                        RequestState.loaded) {
                                      CacheHelper.saveData('token',
                                              state.loginResponse!.token)
                                          .then((value) {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            Routers.galleryScreen,
                                            (route) => false);
                                      });
                                    }
                                    if (state.loginState ==
                                        RequestState.error) {
                                      print('error');
                                    }
                                  },
                                  builder: (context, state) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          BlocProvider.of<LoginBloc>(context)
                                              .add(
                                            LoginButtonPressedEvent(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.blue,
                                        elevation: 0.0,
                                        maximumSize: Size(
                                            SizeConfig.screenWidth * 0.8, 45),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: state.loginState ==
                                                RequestState.loading
                                            ? const CircularProgressIndicator(
                                                color: Colors.amber,
                                              )
                                            : Text(
                                                ' SUBMIT',
                                                style: GoogleFonts.balooThambi2(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.white,
                                                ),
                                              ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
