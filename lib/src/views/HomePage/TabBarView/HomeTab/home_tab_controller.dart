import 'dart:async';
import 'dart:convert';

import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/internet_connection.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/CreatePost/create_post_controller.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  StreamController _isLiked = new StreamController.broadcast();
  StreamController _like = new StreamController.broadcast();
  StreamController _loadPost = new StreamController.broadcast();

  Stream get isLikedStream => _isLiked.stream;
  Stream get likeStream => _like.stream;
  Stream get loadPostStream => _loadPost.stream;

  void likeBehavior(bool is_liked) {
    _isLiked.sink.add(is_liked);
    if (is_liked)
      _like.sink.add(1);
    else
      _like.sink.add(0);
  }

  Map<String, dynamic> postReturn;
  CreatePostController createPostController = new CreatePostController();

  List<PostModel> parsePosts(Map<String, dynamic> json) {
    List<PostModel> temp;
    try {
      temp = (json['posts'] as List).map((x) => PostModel.fromJson(x)).toList();
    } catch (e) {
      print(e.toString());
    }
    return temp;
  }

  String error;
  List<PostModel> list;
  Future<void> fetchListPost() async {
    error = "";
    await _loadPost.sink.add("");
    try {
      await FetchData.getListPostApi(await StorageUtil.getToken())
          .then((value) async {
        if (value.statusCode == 200) {
          var val = jsonDecode(value.body);
          print(val);
          if (val["code"] == 1000) {
            error = "Thành công";
            list = parsePosts(val['data']);
            //StorageUtil.setListPost(list);
            _loadPost.sink.add(list);
          } else {
            error = "Thiếu param";
            _loadPost.addError(error);
          }
        } else {
          print(value.statusCode);
          print(value.body);
          error = "Lỗi server";
          _loadPost.addError(error);
        }
      });
    } catch (e) {
      error = "Ứng dụng lỗi: " + e.toString();
      _loadPost.addError("Không thể truy cập hãy thử lại");
      print(error);
    }
    //return list;
  }

  void dispose() {
    _isLiked.close();
    _like.close();
    _loadPost.close();
  }
}
