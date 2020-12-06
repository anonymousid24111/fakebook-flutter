import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/widgets/notification_widget.dart';
// import 'package:fakebook_flutter_app/src/models/user_notification.dart';

import '../../../../helpers/fetch_data.dart';
import '../../../../helpers/internet_connection.dart';
import '../../../../helpers/shared_preferences.dart';
// import '../../../../models/user_notification.dart';

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationsTabsStateful();
  }
}

class NotificationsTabsStateful extends StatefulWidget {
  _NotificationsTabsState createState() => _NotificationsTabsState();
}

class _NotificationsTabsState extends State<NotificationsTabsStateful> {
  var notifications = [];
  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    var ff = () async {
      String token = await StorageUtil.getToken();
      if (await InternetConnection.isConnect()) {
        var res = await FetchData.getNotification(token, "0", "20");
        var data = await jsonDecode(res.body);
        print(data);
        if (res.statusCode == 200) {
          setState(() {
            notifications = data["data"];
            print(notifications);
          });
        } else {
          print("Lỗi server");
        }
      } else {
        print("Lỗi internet");
      }
    };
    ff();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
            child: Text('Thông báo',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
          ),
          for (var notification in notifications)
            NotificationWidget(notification: notification)
        ],
      )),
    );
  }
}
