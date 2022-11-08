import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../../../core/services/cache_helper.dart';
import '../../../core/utils/api_constant.dart';
import '../../models/get_gallery_data_model.dart';
import '../../../domain/entity/login_response.dart';

import '../../../domain/entity/gallery_data.dart';
import '../../models/login_response.dart';

abstract class BaseRemoteGalleryDataSource {
  Future<LoginResponse> loginToApp(LoginParams params);
  //get gallery
  Future<GalleryData> getGallery();
}

class RemoteGalleryDataSource extends BaseRemoteGalleryDataSource {
  @override
  Future<LoginResponse> loginToApp(LoginParams params) async {
    final response = await Dio().post(
      "${ApiConstant.LOGIN}?email=${params.email}&password=${params.password}",
    );
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      throw Exception("Error🔥");
    }
  }

  @override
  Future<GalleryData> getGallery() async {
    //sw
    final myToken = await CacheHelper.getData("token");
    final response = await Dio().get(
      ApiConstant.GALLERY,
      //send token
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer $myToken', // set content-length
        },
      ),
    );
    print('The response is:👨‍💻 ${response.data}');
    if (response.statusCode == 200) {
      return GetGalleryDataModel.fromJson(response.data);
    } else {
      throw Exception("Error🔥");
    }
  }
}
