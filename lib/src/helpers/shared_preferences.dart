import 'dart:convert';

import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  //TODO: SET DEVICE ID
  static Future<void> setUuid() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  String deviceId = await PlatformDeviceId.getDeviceId;
  _preferences.setString('uuid', deviceId);
  }

  //TODO: GET DEVICE ID
  static Future<String> getUuid() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  return _preferences.getString('uuid');
  }

  //TODO: SET Is Logging
  static Future<void> setIsLogging(bool value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setBool('isLogging', value);
  }

  //TODO: GET Is Logging
  static Future<bool> getIsLogging() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool('isLogging');
  }

  //TODO: SET TOKEN
  static Future<void> setToken(String value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('token', value);
  }

  //TODO: GET TOKEN
  static Future<String> getToken() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getString('token');
  }
  //TODO: DELETE TOKEN
  static Future<void> deleteToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
  }
  //TODO: SET UID
  static Future<void> setUid(String value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('uid', value);
  }

  //TODO: GET UID
  static Future<String> getUid() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getString('uid');
  }

  //TODO: SET USERNAME
  static Future<void> setUsername(String value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('uname', value);
  }

  //TODO: GET USERNAME
  static Future<String> getUsername() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getString('uname');
  }

  //TODO: SET phone
  static Future<void> setPhone(String value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('phone', value);
  }

  //TODO: GET phone
  static Future<String> getPhone() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getString('phone');
  }

  //TODO: SET password
  static Future<void> setPassword(String value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('password', value);
  }

  //TODO: GET password
  static Future<String> getPassword() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getString('password');
  }
  //TODO: DELETE PASSWORD
  static Future<void> deletePassword() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('password');
  }

/*
  //TODO: Set User info
  static Future<void> setUserInfo(UserModel user) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.setString('UserInfo', jsonEncode(user.toJson()));
  }

  //TODO: get User info
  static Future<User> getUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    User user =
    new User.fromJson(jsonDecode(preferences.getString('UserInfo')));
    return user;
  }
 */
  //TODO: Clear Data
  static Future<void> clear() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
  }
}