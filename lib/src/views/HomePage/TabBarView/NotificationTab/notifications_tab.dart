import 'dart:convert';

import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/NotificationTab/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/widgets/notification_widget.dart';
// import 'package:fakebook_flutter_app/src/models/user_notification.dart';

import '../../../../helpers/fetch_data.dart';
import '../../../../helpers/internet_connection.dart';
import '../../../../helpers/shared_preferences.dart';
// import '../../../../models/user_notification.dart';

class NotificationsTab extends StatefulWidget {
  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab>
    with AutomaticKeepAliveClientMixin {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  NotificationController _controller = new NotificationController();

  var notifications = [];

  Future<void> _refresh() async {
    refreshKey.currentState?.show(atTop: false);
    // Clear hết data cũ đi
    await _controller.getNotifications();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: RefreshIndicator(
          key: refreshKey,
          onRefresh: _refresh,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 0),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Thông báo',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                    Container(
                      decoration: new BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.search),
                        color: Colors.black,
                        tooltip: 'search',
                        onPressed: () {
                          Navigator.pushNamed(context, "home_search_screen");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                  stream: _controller.notiStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data != "")
                        return Column(
                          children: [
                            for (var notification in snapshot.data)
                              NotificationWidget(notification: notification)
                          ],
                        );
                      else {
                        return CircularProgressIndicator();
                      }
                    } else if (snapshot.hasError)
                      return Center(
                        child: Text(snapshot.error),
                      );
                    else {
                      _controller.getNotifications();
                      return SizedBox.shrink();
                    }
                  })
            ],
          )),
    );

    SingleChildScrollView(
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
