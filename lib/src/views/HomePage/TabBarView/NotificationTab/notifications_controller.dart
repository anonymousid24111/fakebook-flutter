import 'dart:convert';
import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/internet_connection.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'dart:async';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/CreatePost/create_post_controller.dart';

class NotificationController {
  StreamController _noti = new StreamController.broadcast();
  Stream get notiStream => _noti.stream;

  String error;

  Future<void> getNotifications() async {
    error = "";
    await _noti.sink.add("");
    try {
      await FetchData.getNotification(await StorageUtil.getToken(), "0", "20")
          .then((value) async {
        if (value.statusCode == 200) {
          var val = jsonDecode(value.body);
          print(val);
          if (val["code"] == 1000) {
            error = "Thành công";
            _noti.sink.add(val["data"]);
          } else {
            error = "Thiếu param";
            _noti.addError(error);
          }
        } else {
          error = "Lỗi server";
          _noti.addError(error);
        }
      });
    } catch (e) {
      error = "Ứng dụng lỗi: " + e.toString();
      _noti.addError("Không thể truy cập hãy thử lại");
      print(error);
    }
  }

  void dispose() {
    _noti.close();
  }
}
