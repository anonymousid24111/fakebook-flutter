import 'package:flutter/material.dart';

import '../helpers/fetch_data.dart';
import '../helpers/internet_connection.dart';
import '../helpers/shared_preferences.dart';
// import 'package:fakebook_flutter_app/src/models/user_notification.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';

class NotificationWidget extends StatelessWidget {
  final notification;

  NotificationWidget({this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: notification["id"]["avatar"] != null
                    ? NetworkImage(notification["id"]["avatar"])
                    : AssetImage("assets/avatar.jpg"),
                radius: 35.0,
              ),
              SizedBox(width: 15.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      if (await InternetConnection.isConnect()) {
                        String token = await StorageUtil.getToken();
                        var res = await FetchData.setReadNotification(
                            token, notification["id"]["_id"]);
                        // var data = await jsonDecode(res.body);
                        if (res.statusCode == 200) {
                          print("set read thành công");
                        } else {
                          print("lỗi server");
                        }
                      } else {
                        print("lỗi internet");
                      }
                    },
                    child: Text(
                        notification["id"]["title"] != null
                            ? notification["id"]["title"]
                            : "thông báo mặc định",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                      notification["id"]["created"] != null
                          ? notification["id"]["created"]
                          : "thời gian mặc định",
                      style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                ],
              ),
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: <Widget>[
          //     Icon(Icons.more_horiz),
          //     Text(''),
          //   ],
          // )
        ],
      ),
    );
  }
}
