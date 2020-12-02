import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fakebook_flutter_app/src/apis/api_send.dart';
import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/internet_connection.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/helpers/validator.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:platform_device_id/platform_device_id.dart';

class CreatePostController {
  String _error;

  String get error => _error;

  set error(String value) {
    _error = value;
  }

  Future<String> onSubmitCreatePost(
      {@required List<MultipartFile> images,
      @required MultipartFile video,
      @required String described,
      @required String status,
      @required String state,
      @required bool can_edit,
      @required String asset_type}) async {
    String result = '';
    error = "";
    print('a');
    try {
      if (await InternetConnection.isConnect()) {
        await ApiService.createPost(await StorageUtil.getToken(), images,
                video, described, status, state, can_edit, asset_type)
            .then((val) async {
            if (val["code"] == 1000) {
              result = 'home_screen';
              error = "Dang bai thanh cong";
              print('1a');
            } else {
              error = "Không thể đăng bai";
              print('1b');
            }

        }).catchError((onError) => print(onError.toString()));
      } else
        error =
            "Rất tiếc, không thể đăng nhập. Vui lòng kiểm tra kết nối internet";
    } catch (e) {
      error = "Ứng dụng lỗi: " + e.toString();
      print(e.toString());
    }
    return result;
  }
}
