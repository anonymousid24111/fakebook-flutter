import 'dart:async';
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
  StreamController _addPost = new StreamController.broadcast();
  Stream get addPostStream => _addPost.stream;

  String error;
  PostModel post;

  Future<PostModel> onSubmitCreatePost(
      {@required List<MultipartFile> images,
      @required MultipartFile video,
      @required String described,
      @required String status,
      @required String state,
      @required bool can_edit,
      @required String asset_type}) async {
    error = "";
    _addPost.sink.add("");
    try {
      if (await InternetConnection.isConnect()) {
        await ApiService.createPost(await StorageUtil.getToken(), images, video,
                described, status, state, can_edit, asset_type)
            .then((val) async {
          if (val["code"] == 1000) {
            error = "Dang bai thanh cong";
            var json = val["data"];
            AuthorPost author = new AuthorPost(await StorageUtil.getUid(),
                await StorageUtil.getAvatar(), await StorageUtil.getUsername());
            post = new PostModel(
                asset_type == 'video' ? json['video'] : null,
                json["comment_list"],
                json["like_list"],
                json["_id"],
                described,
                state,
                status,
                json["created"],
                json["modified"],
                json["like"],
                json["is_liked"],
                json["comment"],
                author,
                json["image"]);
            print(post.toJson());
            _addPost.add(post);
          } else {
            error = "Không thể đăng bai";
            _addPost.sink.add(error);
          }
        });
      } else
        error =
            "Rất tiếc, không thể đăng nhập. Vui lòng kiểm tra kết nối internet";
      _addPost.sink.add(error);
    } catch (e) {
      error = "Ứng dụng lỗi: " + e.toString();
      _addPost.sink.add(error);
      print(e.toString());
    }
    return post;
  }

  void dispose() {
    _addPost.close();
  }
}
