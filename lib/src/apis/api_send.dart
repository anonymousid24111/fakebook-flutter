import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:fakebook_flutter_app/src/apis/api_response.dart';
import 'package:dio/dio.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:http_parser/src/media_type.dart';

class ApiService {
  static String apiLink = "https://api-fakebook.herokuapp.com/it4788/";

  static BaseOptions options = BaseOptions(
      baseUrl: apiLink,
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (code) {
        if (code == 200) {
          return true;
        }
      });
  static Dio dio = Dio(options);

  static Future<dynamic> getListPosts(
      String token, int index, int count) async {
    String get_list_post_url = apiLink +
        'get_list_posts' +
        "/?" +
        "token=$token&index=$index&count=$count";
    try {
      Response response = await dio.post(
        get_list_post_url,
        data: [],
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        print(responseJson);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("Incorrect Email/Password");
      } else {
        throw Exception('Authentication Error');
      }
    } on DioError catch (exception) {}
  }

  static Future<dynamic> getComment(
      String token, String id, int index, int count) async {
    String get_list_post_url = apiLink +
        'get_comment' +
        "/?" +
        "token=$token&id=$id&index=$index&count=$count";
    try {
      Response response = await dio.post(
        get_list_post_url,
        data: [],
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        print(responseJson);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("Incorrect Email/Password");
      } else {
        throw Exception('Authentication Error');
      }
    } on DioError catch (exception) {}
  }

  static Future<dynamic> createPost(
      String token,
      List<MultipartFile> images,
      MultipartFile video,
      String described,
      String status,
      String state,
      bool can_edit,
      String asset_type) async {
    String createPostURL = apiLink +
        'add_post' +
        "/?" +
        "token=$token&described=$described&status=$status&state=$state&can_edit=$can_edit";
// <<<<<<< HEAD
//     print(asset_type);
//     FormData image_form = new FormData.fromMap({'images': images});
//     print(images);
//     FormData video_form;
//     if(video!=null&&video.path!=null){
//       video_form = new FormData.fromMap({'video': await MultipartFile.fromFile(video.path, filename: "video", contentType: MediaType("video", "mp4"))});
//     }else{
//       video_form = image_form;
//     }

// =======
    print(images.length);
    print(video);
    FormData image_form = new FormData.fromMap({'images': images});
    FormData video_form = new FormData.fromMap({'video': video});
    FormData formData = asset_type == "image" ? image_form : video_form;
    print(asset_type);
// >>>>>>> 5ba0e474dbf0fa4dfb8ac718ff6c34d6b243fd83
    try {
      Response response = await dio.post(
        createPostURL,
        data: asset_type == "" ? [] : formData,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        print(responseJson);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("401 code");
      } else {
        throw Exception('Authentication Error');
      }
    } on DioError catch (exception) {
      print(exception.toString());
    }
  }
}
