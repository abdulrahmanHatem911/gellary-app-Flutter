import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:gellary_app/core/utils/api_constant.dart';
import 'package:gellary_app/data/models/get_gallery_data_model.dart';
import 'package:gellary_app/domain/entity/login_response.dart';

import '../../../core/services/cache_helper.dart';
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
    final response = await Dio().get(
      ApiConstant.GALLERY,
      //send token
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTE3MTBmNTA4MzFmY2NiNDYwNGExMzY0ODJmNDFiZjU5OTEzY2JkY2ZhZmU2ZDY1OWJmZmQ5OGVkODE1MDk5MTRmNTRmMjZmZDA2NGZjZDIiLCJpYXQiOjE2NjcyODk3ODUuMDMzMTk5LCJuYmYiOjE2NjcyODk3ODUuMDMzMjAzLCJleHAiOjE2OTg4MjU3ODUuMDI2MzI0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.bWImC0xkzNQe8iKxL1Scg0tGGZGUy3vWsiX1vBzj1gLvynIMJcOqVkEVZc2C3MgSaCHjyqGkN7zWyqYVqLasAaKKFmj9JiQgXozvPcHJPoJCGQQvogt-gnM0DPeFMF-g_CVJPNZ3nUkXpOLl3Os5DhvW53OVT1n5pisoNyvsrEJURWTXxt1EIxwnmoj0An8y9kq2WSX4Zn2RoVGKe3QnL-KOGKksfv2ahj7hG-ZNwVYazI6TXCIxZBCYGoZtfvq9CjTrVUcCBSiGgdyaJzAZi0lNR2c2zcZxWGbBQ_QvfTFDZmmPyogScE5cgy4MGsnYe4Sw7qLmHIrSsrMaJxRgQ_b7xobq9ob1vDhw9O-VcPpiCllEFyjMkdKOFC8UffoYZB3bafp9KZB6Dr3tS7fo6f4ojAKnj-b8g6AigjuFb4FAYlC0vxT76mtvvYFm8MjH1kH2QmJ0HzvhBxv45K9Cdtuvr3DdrwyDaoROR4eZ6S-Xp-LYuCkZ-e4UenLJC4mDUu8u6xoyLHKul3FhNlAUMj-oScKZgJxRUYhbVxzXruHwaycKdlX284-Y6cfSAf3AjIvfaXYeB1ajGuuCtYceBVGM5tDxY4i9I7kthk3DNRjaRQPIl5c8GQlYV3I3p-RItB33Y-ECNiG92U2fgB8fAVw5urOuFX7pIZZ0NEc6VAY',
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
