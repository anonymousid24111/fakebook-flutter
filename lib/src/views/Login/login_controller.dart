import 'dart:async';
import 'dart:convert';

import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/internet_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/helpers/utils.dart';
import 'package:fakebook_flutter_app/src/helpers/validator.dart';
import 'package:fakebook_flutter_app/src/models/user.dart';

class LoginController {
  String _error = "";

  String get error => _error;

  set error(String value) {
    _error = value;
  }

  Future<String> onSubmitLogIn({
    @required String phone,
    @required String password,
  }) async {
    int countError = 0;
    String result = '';

    if (!Validators.isValidPhone(phone) && !Validators.isPassword(password)) {
      await Future.delayed(Duration(seconds: 2));
      error = "Vui long nhap dung thong tin";
      countError++;
    } else if (!Validators.isPassword(password)) {
      await Future.delayed(Duration(seconds: 2));
      error = "Mật khẩu không hợp lệ";
      countError++;
    } else if (!Validators.isValidPhone(phone)) {
      await Future.delayed(Duration(seconds: 2));
      error = "Số điện thoại không hợp lệ";
      countError++;
      print("3a");
    }

    //TODO: Sign in function
    if (countError == 0) {
      try {
        if (await InternetConnection.isConnect()) {
          await FetchData.logInApi(phone, password, await StorageUtil.getUuid())
              .then((value) async {
            if (value.statusCode == 200) {
              var val = jsonDecode(value.body);
              print(val);
              if (val["code"] == 1000) {
                StorageUtil.setUid(val["data"]["id"]);
                StorageUtil.setToken(val["data"]["token"]);
                StorageUtil.setIsLogging(true);
                result = 'home_screen';
              } else {
                error = "Không tồn tại user này";
              }
            } else {
              error = "Lỗi server";
            }
          });
        }
        else error="Rất tiếc, không thể đăng nhập. Vui lòng kiểm tra kết nối internet";
      } catch (e) {
        error = "Ứng dụng lỗi: " + e.toString();
      }
    }
    return result;
  }
/*
  void dispose() {
    _isPhone.close();
    _isPassword.close();
    _isBtnLoading.close();
    _isLogin.close();
  }

 */
}
