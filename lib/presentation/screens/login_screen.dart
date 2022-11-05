import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary_app/core/routers/app_routers.dart';
import 'package:gellary_app/core/services/services_locator.dart';
import 'package:gellary_app/core/style/app_color.dart';
import 'package:gellary_app/presentation/controller/Login/login_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/services/cache_helper.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/enum.dart';
import '../controller/Login/login_event.dart';
import '../controller/Login/login_state.dart';
import '../widgets/text_form_filed_component.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: width,
                height: height,
                color: Colors.green,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_backgground.png'),
                ),
              ),
              Positioned(
                top: -40,
                left: 40,
                child: Container(
                  width: width * 0.4,
                  height: height * 0.3,
                  child: const Image(
                    image: AssetImage('assets/images/camera.png'),
                  ),
                ),
              ),
              Center(
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
                      width: width * 0.8,
                      height: height * 0.45,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: BlocConsumer<LoginBloc, LoginState>(
                                    listener: (context, state) {
                                      if (state.loginState ==
                                          RequestState.loaded) {
                                        CacheHelper.saveData('token',
                                                "${state.loginResponse!.token}")
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
                                          if (_formKey.currentState!
                                              .validate()) {
                                            BlocProvider.of<LoginBloc>(context)
                                                .add(
                                              LoginButtonPressedEvent(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.blue,
                                          elevation: 0.0,
                                          maximumSize: Size(width * 0.8, 45),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                          child: state.loginState ==
                                                  RequestState.loading
                                              ? CircularProgressIndicator(
                                                  color: Colors.amber,
                                                )
                                              : Text(
                                                  ' SUBMIT',
                                                  style:
                                                      GoogleFonts.balooThambi2(
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
        ));
  }
}
