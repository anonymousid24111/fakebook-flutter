import 'dart:async';
import 'dart:convert';

import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/helpers/utils.dart';
import 'package:fakebook_flutter_app/src/helpers/validator.dart';
import 'package:fakebook_flutter_app/src/models/user.dart';

class LoginController {
  StreamController _isPhone = new StreamController.broadcast();
  StreamController _isPassword = new StreamController.broadcast();
  StreamController _isBtnLoading = new StreamController.broadcast();
  StreamController _isLogin = new StreamController.broadcast();

  Stream get phoneStream => _isPhone.stream;
  Stream get passwordStream => _isPassword.stream;
  Stream get btnLoadingStream => _isBtnLoading.stream;
  Stream get loginStream => _isLogin.stream;


  // ignore: missing_return
  Future<String> onSubmitLogIn({
    @required String phone,
    @required String password,
  }) async {
    int countError = 0;
    String result = '';

    _isPhone.sink.add('Ok');
    _isPassword.sink.add('Ok');
    _isLogin.sink.add("Ok");

    if (!Validators.isValidPhone(phone)) {
      _isPhone.sink.addError('Số điện thoại không hợp lệ');
      countError++;
    }
    if (!Validators.isPassword(password)) {
      _isPassword.addError('Mật khẩu không hợp lệ');
      countError++;
    }

    print(countError);
    //TODO: Sign in function
    if (countError == 0) {
      try {
        _isBtnLoading.sink.add(false);
        await FetchData.logInApi(phone, password, await StorageUtil.getUuid()).then((value) {
          if(value.statusCode == 200){
            var val = jsonDecode(value.body);
            print(val);
              if(val["code"]==1000){
                StorageUtil.setUid(val["data"]["id"]);
                StorageUtil.setToken(val["data"]["token"]);
                StorageUtil.setIsLogging(true);
                result = 'home_screen';
              }
              else _isLogin.sink.add("Khong co user nay");
          }
          else {
            _isLogin.sink.add("Khong ket noi duoc voi server");
            print("That bai");
          }
        });
      } catch (e) {
        _isBtnLoading.sink.add(true);
        print("that bai");
      }
      _isBtnLoading.sink.add(true);
      print(result);
      return result;
    }
  }

  void dispose() {
    _isPhone.close();
    _isPassword.close();
    _isBtnLoading.close();
    _isLogin.close();
  }
}
