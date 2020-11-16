import 'dart:convert';

import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/internet_connection.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/helpers/validator.dart';
import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:flutter/material.dart';

class SignupController {
  String _error = "";

  String get error => _error;

  set error(String value) {
    _error = value;
  }

  Future<String> onSubmitSignup({
    @required UserModel user,
  }) async {
    String result = '';
    //TODO: Sign in function
    try {
      if (await InternetConnection.isConnect()) {
        await FetchData.signUpApi(
                user.phone, user.password, await StorageUtil.getUuid())
            .then((value) async {
          if (value.statusCode == 200) {
            var val = jsonDecode(value.body);
            print(val);
            if (val["code"] == 1000) {
              result = 'login_screen';
            } else if (val["code"] == 9996) {
              result = 'signup_screen';
              error = "User đã tồn tại";
            } else
              error = "Không thể đăng ký";
          } else {
            error = "Lỗi server";
          }
        });
      } else
        error =
            "Rất tiếc, không thể đăng nhập. Vui lòng kiểm tra kết nối internet";
    } catch (e) {
      error = "Ứng dụng lỗi: " + e.toString();
    }
    return result;
  }
}
